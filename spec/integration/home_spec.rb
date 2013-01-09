require 'spec_helper'

describe 'home page', :js => true do

  include SpecMacros

  it 'welcomes the user' do
    visit '/'
    page.should have_content('Home')
  end

  it 'can login as admin' do
    login 'admin@localhost.com', 'admin000'
    visit '/'
    page.should have_content('Admin')
  end
end
