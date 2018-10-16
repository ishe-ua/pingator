# Pingator

Url (site) monitoring tool.

## Software stack

* Ruby, Rails
* Postgres, Redis
* TODO: Firefox for system tests

## Links

* [pingator.com](http://pingator.com)
* [pingator.com/sidekiq](http://pingator.com/sidekiq)

# External services

* [mailgun](http://mailgun.com) for __send__ emails
* [circle ci](http://circleci.com) for __ci__

## Tasks and utils

* bin/doc
* git push dokku master

## READ

* Scaling I/O
https://github.com/jondot/sneakers/wiki/How-To:-Scrape-Web-Pages
https://www.metabrew.com/article/a-million-user-comet-application-with-mochiweb-part-1

* Подтверждение права собственности на домен с помощью записи TXT
https://support.google.com/a/answer/183895

* Увидеть все txt-записи домена
dig +nocmd -t txt pingator.io +noall
