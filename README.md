# Kotoha Server
Kotoha help you to quote a good phrase.


# Development
## Heroku Setup
```
# Create app
$ heroku create kotoha-server
# Generate secret_token
$ heroku config:set SECRET_KEY_BASE=`rake secret`
# Set timezone
$ heroku config:add TZ=Asia/Tokyo
# Initialize NewRelic
$ heroku addons:add newrelic
# Set Logentries
$ heroku addons:add logentries
# Set MySQL
$ heroku addons:add cleardb:ignite
$ heroku config | grep CLEARDB_DATABASE_URL
# => CLEARDB_DATABASE_URL:        mysql://xxxx
$ heroku config:set  DATABASE_URL='mysql2 xxx' --app kotoha-server
# Deploy
$ git push heroku master
# Migrate
$ heroku run rake db:migrate
```
