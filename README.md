# README

Snitch is a dev-server git status reporting tool. It was designed to track the current status of many repos across many linux-based servers. It does this with the help of these tools which should already be installed on your dev servers:

* Git CLI 
* Curl
* Cron

# Setup on Heroku (fastest)

Snitch-on-Rails is a Rails-based app, and the easiest way to get a Rails app up and running is to deploy it to Heroku. Here's how to do it.

1. Create a heroku account (http://www.heroku.com)
2. $ git clone https://github.com/btwelch/snitch-on-rails.git
3. $ cd snitch-on-rails
4. $ heroku create
5. Copy the Heroku server name you are given
6. $ git push heroku master
7. $ heroku run rake db:migrate

Now you should be up and running with a Snitch server on Heroku. Nicely done!

But, wait! There's a bit more to do!


# Setup the Snitch "Client" on Your Dev Servers

In order for Snitch to know the status of your repos, each dev server must be setup with a cron process that periodically invokes the Snitch "Client" shell script. Here's how to do that:

1. $ ssh user@yourserver
2. yourserver$ cd opt/
3. yourserver$ vim snitch.sh
4. Insert the contents of this project's file client/snitch.sh into the vim editor
5. Change "host" of the snitch.sh script to be the Heroku server name you copied from step #5 in "Setup on Heroku"
6. Setup a curl request for every repo on your server (see Setup of Repo Reporting for details)
7. Save the snitch.sh script
8. yourserver$ chmod 777 snitch.sh
9. yourserver$ crontab -e 
10. Insert */5 * * * * /opt/snitch.sh to the crontab file.
11. Save the crontab file and exit.

Now you should have a shell script that is run every 5 minutes that reports the repo statuses to the Snitch server.


# Setup of Repo Reporting

Coming soon.