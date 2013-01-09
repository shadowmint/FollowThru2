ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Capybara
require 'capybara/rspec'
require 'capybara/rails'

# Seed database
load "#{Rails.root}/db/seeds.rb" 

# Import helpers
require "support/SpecMacros.rb"
