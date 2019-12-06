## Ruby version

  This project requires Ruby 2.6.5 as denoted in the `.ruby-version` file. This project also requires Rails 6.0. Run the `bundle` command to install Rails and all other Gem dependencies. See the Gemfile for additional notes.

## System dependencies

## Configuration
  Ask someone in charge about `credentials.yml.enc` and `master.key`

  To open e.g. in atom, use `EDITOR="atom --wait" rails credentials:edit`
  To open in vim, make sure it's up to date and use `EDITOR=vim rails credentials:edit`

  Set up locking strategy during configuration (https://github.com/plataformatec/devise/wiki/How-To:-Add-:lockable-to-Users).
## Database creation

  MySQL 5.7 is the recommended version to run on your machine. Once you have MySQL running, run:
  `cp config/database.example.yml config/database.yml`
  and configure your config/database.yml to your machine's MySQL configuration. Minor edits should only be necessary.

## Database initialization

  Run rake db:setup to create and migrate the database from schema (db/schema.rb).

## Vault
Vault is a key component to this project. We mostly are using its Encryption As A Service feature. This functionality is wrapped by the vault-rails gem.

Please note that we currently are using a forked version of the Gem until Rails 5.2 is supported in the native gem. See this PR for details.

In the test and development modes you do not need an actual Vault server running. The gem will intercept and perform all encryption that would normally by done by the Vault encryption server.
## How to run the test suite

  `rails test` # run all tests
  `rails test test/models` # run all tests from specific directory
  `rails test test/models/article_test.rb` # run all tests from specific file
  `rails test test/models/article_test.rb:6` # run specific test and line

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

### hCaptcha

The hCaptcha gem does not respond to traffic coming from `localhost`, as per the "Local Development" section in https://docs.hcaptcha.com

On a Mac, you'll need to add the following to your `/etc/private/hosts` (`/etc/hosts` on Ubuntu):

```
127.0.0.1       localhost.fmadata.com
127.0.0.1       test.fmadata.com
```

To run hCaptcha correctly in the local environment you have to use `http://test.fmadata.com:3000/` link in the browser