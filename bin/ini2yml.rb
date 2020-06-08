require 'iniparser'
require 'yaml'

hash = INI.load_file( 'planet.ini' )

yaml = []

hash.each do |key, section|
  if section.is_a?(Hash)
    yaml << section
  end
end

File.open('_data/planet.yml', 'w') { |file| file.write(yaml.to_yaml) }
