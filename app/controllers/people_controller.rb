class PeopleController < ApplicationController
  def index
    @users = User.all
  end
end
