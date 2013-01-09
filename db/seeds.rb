# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def __validate object
  if !object.valid?
    puts "ERROR! Unable to create #{object.class.name}"
    object.errors.messages.each do |e|
      puts "- #{e}"
    end
  else
    object.save
  end
end

def __trace msg
  if ENV["RAILS_ENV"] != "test"
    puts msg
  end
end

# Reset database
__trace 'Deleting database records.'
User.delete_all
VPaymentType.delete_all

# Users
__trace 'Setting up admin login: admin@localhost.com/admin000'
user = User.new :name => 'admin', :email => 'admin@localhost.com', :password => 'admin000', :password_confirmation => 'admin000'
user.skip_confirmation!
user.add_role :admin
__validate user

# User data
ud = VUserData.new
ud.user = user
__validate ud

# Payment types
__trace 'Setting up default payment types'

pay = VPaymentType.new :name => "Cash"
pay.v_user_data = ud
__validate pay

pay = VPaymentType.new :name => "Netbank" 
pay.v_user_data = ud
__validate pay
