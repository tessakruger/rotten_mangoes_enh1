class Admin::UsersController < ApplicationController

  def index
    render text: "Hey admin"
  end

  def new
    render text: "This is an admin page"
  end

  def create
    render text: "Create an admin"
  end

end