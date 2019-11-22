# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Vault
Vault is a key component to this project. We mostly are using its Encryption As A Service feature. This functionality is wrapped by the vault-rails gem.

Please note that we currently are using a forked version of the Gem until Rails 5.2 is supported in the native gem. See this PR for details.

In the test and development modes you do not need an actual Vault server running. The gem will intercept and perform all encryption that would normally by done by the Vault encryption server.
