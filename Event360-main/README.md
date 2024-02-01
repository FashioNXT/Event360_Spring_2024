# Events 360 by FashioNXT

A user management and analytics tracking application for the group of applications managed by FashioNXT built using Ruby on Rails.

## CRM Service

This application is built using Ruby on Rails equipped with JavaScript, HTML and CSS. 


![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
 

## Note

This application works the best when used with the following applications:
- [PlaNXT](https://github.com/tamu-edu-students/PLAN-NXT)
- [EventNXT](https://github.com/tamu-edu-students/EventNXT-606-Spring2023)
- [CastNXT](https://github.com/tamu-edu-students/CastNXT_Spring2023)

## To deploy this application locally
- Clone the GitHub repo: `git clone git@github.com:tamu-edu-students/FashioNXT-CRM-Service.git`
- `cd FashioNXT-CRM-Service`
- Install bundler for Ruby: `gem install bundler`
- Install the app requirements: `bundle install`
- Setup the local sqlite DB: `rake db:create db:migrate`
- Set ENV vars for mailer by creating a file `config/local_env.yml` (copy the format from `config/local_env.yml.example`)
- Run the app using: `rails s`
- Visit http://127.0.0.1:3000 to see the Application running.

## Heroku Deployment
For Heroku deployment, follow the steps below:
- [Deployment guide for rails application](https://devcenter.heroku.com/articles/getting-started-with-rails6)

- Install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
- Login to Heroku using the command: `heroku login`
- Create a Heroku app using the command: `heroku create`
- Push the changes to Heroku using the command: `git push heroku main`
- Run db migrations: `heroku run rake db:migrate`
- Set ENV vars according to `config/local_env.yml.example` in Heroku dashboard

## Running Tests
- Run the RSpec tests using the command: `rspec`
- Run the Cucumber tests using the command: `cucumber`
- The above mentioned tests can also be run together using the command: `rake`
- Selenium tests can be run using the command: `rake test:system`
