# 🌎 [Planet Bugzilla](https://planet.bugzilla.org)

Planet Bugzilla is a web feed aggregator that collects blog posts from people who contribute to Bugzilla.

## Adding your feed
If you want to get your feed added, we prefer Pull Requests via GitHub.

* Fork this repository
* Edit [planet.ini](https://github.com/bugzilla/planet-bugzilla/blob/master/planet.ini) and add:

```ini
[id]         # replace id with your feed's unique identifier (a-z0-9-_) (eg. bugzilla)
  title    = # title of your feed                                       (eg. Bugzilla)
  feed     = # url to your rss/atom feed                                (eg. https://www.bugzilla.org/feed)
  link     = # link to the main page of your website                    (eg. https://www.bugzilla.org)
```

* Send a Pull Request

## Development environment
To run this website locally, use the following commands:
```sh
bundler install
bundler exec rake build
bundler exec jekyll serve
```
and visit [127.0.0.1:4000](http://127.0.0.1:4000)
