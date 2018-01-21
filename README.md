# README


## Introduction
A note taking and sharing app orginally written in 12 hours for the final assessment of my bootcamp!

Subsequent additions as and when I learn something new!

## System Specs
Ruby Version 2.4.1
Rails 5.1.4

## Gems
- Simple_form
- Devise 4.0
- Bootstrap 4.0 Beta
- Rubocop
- RSpec
- Shoulda-matchers
- Factory Bot
- Faker

## Installation
Follow this guide for installation of the program.
1. Using your terminal, clone the repository to your computer.
```
git clone https://github.com/jonthtang/nwitter.git
```

2. Install dependencies
```
bundle install
```

3. Install specific gems
```
Follow the instructions for gem installation for the following gems.
- Simple_form - https://github.com/plataformatec/simple_form
- Devise 4.0 - https://github.com/plataformatec/devise
- Bootstrap 4.0 Beta - https://github.com/twbs/bootstrap
- Rubocop - https://github.com/github/rubocop-github
- RSpec - https://github.com/rspec/rspec-rails
- Shoulda-matchers - https://github.com/thoughtbot/shoulda-matchers
- Factory Bot - https://github.com/thoughtbot/factory_bot_rails
- Faker - https://github.com/stympy/faker
```

4. Create the database
```
rake db:create db:migrate db:seed
```

## App Deployment
Run
```
rails s
```
In your browser, type
```
localhost:3000/
```
