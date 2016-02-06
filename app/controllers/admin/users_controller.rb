class Admin::UsersController < ApplicationController

	def index
	  @users = User.all
	  @users = User.order(:firstname).page params[:page]
	end

  def new
    render text: "This is an admin page"
  end

  def create
    render text: "Create an admin"
  end


end