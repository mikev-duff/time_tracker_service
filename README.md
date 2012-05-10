# Duff Rails Springboard

## Overview

This project can be used as a starting point for your own Rails projects.

It's based on the excellent [*Ruby on Rails Tutorial: Learn Rails by Example*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/), up to and including Chapter 9.
If there's any line of code in this project you would like to understand further, it can be explained in this tutorial,
which walks you through creating this project from scratch starting with 'rails create'.

The goal is to provide the basic facilities one might typically require when starting a new project, such
as the ability to create users, allow them to sign in/out, authentication, etc, based on a solid implementation.

In particular, this project includes:

- sign-in/sign-out/sign-up
- ability for users to change their name/email address/passwords
- authentication with secure (encrypted) passwords
- remebering signed-in users via cookies
- authorization (to prevent a user from accessing another user's data for example)
- SSL enabled by default
- reasonable CSS styles based on Bootstrap
- administrator privileges, allowing for deletion of users for example
- Postgres database by default, for easy deployment with Heroku free usage tier
- lots of integration tests using RSpec
- based on the latest and greatest version of Rails, version 3.2
- standard REST and MVC architecture
- Ready to deploy on Heroku

## TODO

Here are some things that could be improved:

- add Guard/Spork for automated testing
- add Cucumber for Behavior Based Design
- add seed data to create admin user

## Requirements

You'll need the following installed to develop locally:

- ruby 1.9.2 (RVM works well)
- rails (gem install rails)
- Postgres (http://www.postgresql.org/download/macosx/)


## Running and Deploying

To run the tests, use:

    bundle exec rspec spec/


To run server locally:

    rail s

To deploy to Heroku:

    heroku create --stack cedar [appname]
    git push heroku master
    heroku run rake db:migrate

To debug on Heroku:

    heroku logs

and/or

    heroku run console

