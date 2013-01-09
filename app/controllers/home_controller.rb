class HomeController < ApplicationController

  # Homepage
  def index
    @users = User.all
  end

  # Links to edit own projects
  def edit
  end
end
