# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version

  This project requires Ruby 2.6.5 as denoted in the `.ruby-version` file. This project also requires Rails 6.0. Run the `bundle` command to install Rails and all other Gem dependencies. See the Gemfile for additional notes.

## System dependencies

## Configuration
Ask someone in charge about `credentials.yml.enc` and `master.key`

## Database creation

  MySQL 5.7 is the recommended version to run on your machine. Once you have MySQL running, run:
  `cp config/database.example.yml config/database.yml`
  and configure your config/database.yml to your machine's MySQL configuration. Minor edits should only be necessary.

## Database initialization

  Run rake db:setup to create and migrate the database from schema (db/schema.rb).

## How to run the test suite

  `rails test` # run all tests
  `rails test test/models` # run all tests from specific directory
  `rails test test/models/article_test.rb` # run all tests from specific file
  `rails test test/models/article_test.rb:6` # run specific test and line

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions