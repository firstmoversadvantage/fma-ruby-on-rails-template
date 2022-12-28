# RAILS TEMPLATE 
This repo is a template to be used for creating new projects.

## System dependencies                                                                                                                                  
  - Ruby (see .ruby-version)
  - Rails 6.1+
  - MySQL 8+  
  - Redis     
  - Node (see .nvmrc)

## Template Notes
After creating your new project, you will need to touch some files to customize the new environment. Those files are:  

- .ruby-gemset to create a gemset for your new app.
- config/deploy/* to provide the host names for each deployment target.
- config/deploy.rb to update the project name & other deployment settings.
- Run `EDITOR=vim rails credentials:edit` to initialize the Rails encrypted credentials files. See config/credentials.example.yml for some of the environment variables that you should copy to 
config/credentials.yml.enc
- config/database.yml to reflect the proper database name and other settings. There is an example in `config/database.example.yml`
- Look at `config/initializers/site_information.rb` and make changes as needed to the constant values shown there.
- Perform a 'find all' to look for 'fmaprivacy' and 'fmadata'. Modify those values as needed.
- You will also need to go through the views to remove/change some of the current boiler plate, logo, etc.
- This template is configured for the free version of Sidekiq. Review the Gemfile and config/routes.rb files if you are using Sidekiq Pro.
- Change the name of the application in `config/application.rb`. Change FMAdataTemplate to something meaningful.

NOTE: If you find other files that need to be touched after creating a new project please come back here and update the documentation!

## Configuration and installation

### Credentials 

See Keybase for master.key for this project.
To generate credentials, run:
  - in atom, use `EDITOR="atom --wait" rails credentials:edit`
  - in vim use `EDITOR=vim rails credentials:edit`
Enter your keys, save and exit. See config/credentials.example.yml for examples.

Set up locking strategy during configuration (https://github.com/plataformatec/devise/wiki/How-To:-Add-:lockable-to-Users).

### Gems

Run `bundle install` command to install Rails and all other Gem dependencies. 

### Database creation

MySQL 8 is the recommended version to run on your machine. Once you have MySQL running, run:
  `cp config/database.example.yml config/database.yml`
and configure your config/database.yml to your machine's MySQL configuration. Minor edits should only be necessary.

NOTE: Please see doc/mysql_mac_os_notes.txt if you see test errors like `drb.rb:1259 run> terminated with exception (report_on_exception is true):`

Run rake db:setup to create and migrate the database from schema (db/schema.rb).

### Attribute Encryption
Attribute encryption on models is required for any attribute that contains personal information or other sensitive data. The default solution is the attr_encrypted gem. A more secure alternative is Vault.

#### Vault
Vault is an optional component to this project. We mostly are using its Encryption As A Service feature. This functionality is wrapped by the vault-rails gem.

Please note that we currently are using a forked version of the Gem until Rails 5.2+ is supported in the native gem. See this PR for details.

In the test and development modes you do not need an actual Vault server running. The gem will intercept and perform all encryption that would normally by done by the Vault encryption server.

To use Vault, search the project for 'vault' and read the comments.

## Other dependencies 

### S3
To store assets on s3, use `EDITOR="atom --wait" rails credentials:edit` to enter amazon credentials. See examples in config/credentials.example.yml.
By default, images are stored locally for development and test environments, and on s3 in production environment (look for `config.active_storage.service` to change it).
See comments in credentials.example.yml and storage.yml for more details.

### Captcha
Visit https://developers.google.com/recaptcha/intro to see how to use reCAPTCHA. You'll need to register your website at https://www.google.com/recaptcha/admin/, choose catcha type, and you'll get site_key and secret_key. Put them in the credentials.
For development, you will find sample keys in config/credentials.yml.enc.

## Tests 

### How to run the test suite
  `rails test` # run all tests
  `rails test test/models` # run all tests from specific directory
  `rails test test/models/article_test.rb` # run all tests from specific file
  `rails test test/models/article_test.rb:6` # run specific test and line

If you see errors related to yarn or webpacker, try `yarn upgrade` and `yarn install`

### Factories
Please use factories, eg. `User` factory when you need users, more info in 'test/factories/user.rb'


## Deployment
Follow the instructions for Capistrano

