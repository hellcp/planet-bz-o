require 'iniparser'
require 'faraday'
require 'nokogiri'
require 'uri'

hash = INI.load_file( 'planet.ini' )

hash.each do |key, section|
  if section.is_a?(Hash)
    print ":: #{key} =>  "
    feed = section['feed'] if section.has_key?('feed')
    url_arr = []
    url_arr << section['link'] if section.has_key?('link')
    url_arr << feed if feed
    # Check if URLs return 200 status
    url_arr.each do |url|
      res = Faraday.get(URI(url))
      error = "✗\nNon successful status code #{res.status} when trying to access `#{url}`"
      abort("#{error}\nTry using `#{res.headers['location']}` instead") if res.status.to_i.between?(300, 399) && res.headers.has_key?('location')
      abort(error) unless res.status.to_i == 200
    end
    print '✓ '
    # Check is the XML actually parses as XML
    xml = Faraday.get(URI(feed)).body
    xml_err = Nokogiri::XML(xml).errors
    abort("✗\nUnusable XML syntax: #{feed}\n#{xml_err}") unless xml_err.empty?
    puts '✓ '
  end
end
