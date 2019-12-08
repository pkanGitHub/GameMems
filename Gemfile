# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'sinatra'
gem 'activerecord', require: 'active_record'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'sqlite3'
gem 'rake'
gem 'require_all'
gem 'pry'
gem 'shotgun'
gem 'bcrypt'
gem 'thin' # A thin and fast web server


group :test do
    gem 'rspec'
    gem 'capybara'
    # Capybara is an integration testing tool for rack based web applications. 
    # It simulates how a user would interact with a website 
    gem 'rack-test'
    gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
    # Strategies for cleaning databases. Can be used to ensure a clean state for testing.
end