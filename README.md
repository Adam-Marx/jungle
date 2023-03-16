# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

![image](https://user-images.githubusercontent.com/118940458/225480009-fefc84fb-11fe-4449-94a2-3ff1fe4db005.png)


Worked on several features that include: 

- About Page
- Administrator Categories Page
- Dashboard with Product/Category counts
- Order Details page after payment is completed
- "Sold Out" Badge for out of stock products
- User Authentication

And various fixes to existing features.

## Testing

The project introduced me to the Rspec library for testing code in Rails. 
There are Rspec tests for:

- Product Model
- User Model

As well as my second rodeo with Cypress, making end-to-end tests for:

- Loading the home page
- Loading the product page after clicking on a product in the hme page
- Adding a product to the cart

## Setup

This project uses Rails 6.1.5.1 and Postgres 10.23.

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing


Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- pg (PostgreSQL) gem
- Puma gem
- Sass-Rails gem
- Webpacker gem
- Turbolinks gem
- Jbuilder gem
- Jquery-Rails gem
- SDoc gem
- Bcrypt gem
- Font-Awesome-Rails gem
- Money-Rails gem
- Stripe gem
- Rmagick gem
- Faker gem
- Carrierwave gem
- Bootsnap gem
- Byebug gem
- Dotenv-Rails gem
- Web-Console gem
- Rack-Mini-Profiler gem
- Listen gem
- Spring gem
- Capybara gem
- Selenium-Webdriver gem
- Webdrivers gem
- Tzinfo-Data gem
- RSpec-Rails gem
- Net-SMTP gem
- Cypress-Rails gem
- Database_Cleaner-Active_Record gem
