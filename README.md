# README

Steps to clone setup ans run the app

* git clone "repo goes here"

* bundle install

* rake db:setup

Run this command to install migration used for gem 'acts-as-taggable-on'
* rake acts_as_taggable_on_engine:install:migrations

* rake db:migrate

* rails s
* ...
