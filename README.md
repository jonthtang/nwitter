# README


## Introduction
A note taking and sharing app orginally written in 12 hours for the final assessment of my bootcamp!

Update Jan 24th, 2018:
- Pagination with AJAX
- Upload Avatar or use the default Avatar API

Subsequent additions as and when I learn something new!

## System Specs
Ruby Version 2.4.1
Rails 5.1.4

## Gems
- Simple_form
- Devise 4.0
- Omniauth-facebook
- Bootstrap 4.0 Beta
- jQuery-rails
- Rubocop
- RSpec
- Shoulda-matchers
- Factory Bot
- Faker
- Mini_magick
- Carrierwave
- Bootstrap-will_paginate

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

3. Install mailcatcher
```
gem install mailcatcher
```

4. Run mailcatcher
```
mailcatcher
```
Emails sent can be checked at http://127.0.0.1:1080 

5. Create the database
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
