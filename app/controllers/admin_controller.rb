class AdminController < ApplicationController
  def index
    @users = User.all
    @users = User.new
  end
end
