require 'spec_helper'

describe 'home page', :js => true do

  include SpecMacros

  it 'can get to the edit page as a user' do
    login 'admin@localhost.com', 'admin000'
    visit edit_path
    page.should have_content('Edit')
  end
end
