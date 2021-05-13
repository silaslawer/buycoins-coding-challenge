# BuyCoins Coding Challeng

API that powered by GraphQL and Ruby on Rails.

[Heroku Live API Verison](https://buycoins-silas.herokuapp.com/)

## What you need

- [Ruby](https://www.ruby-lang.org/en/): This project uses `Ruby v 2.6.6`.

- [Bundler](https://rubygems.org/gems/bundler/versions/1.16.2): You can grab the latest version of the bundler by running `gem install bundler`. You will need this to grab all the dependencies of the application.

- [Ruby on Rails](https://www.rubyonrails.org/): This project uses `Rails v 6.1.3.2`

## Project Setup

First things first, Clone this repository on your computer with the following command: `git clone https://github.com/silaslawer/buycoins-coding-challenge.git`

### Setup

1. Run `bundle install` to grab all the dependencies.
3. Run `bin/server` to start the application on [http://localhost:3000](http://localhost:3000). A GraphQL client [http://localhost:3000/graphiql](http://localhost:3000/graphiql).

NB: Windows users must run these commands in git bash

## How to run the test suite

Rubocop for static code analysis of our Ruby code and Rspec for testing models & controllers. To execute the test suite, run `bin/test`.
