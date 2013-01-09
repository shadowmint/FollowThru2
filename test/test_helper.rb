ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  ## Reseed the database for 'DbBlahTest' classes.
  setup do
    if self.class.name.starts_with? "Db"
      load "#{Rails.root}/db/seeds.rb"
    end
  end

  # Add more helper methods to be used by all tests here...
end
