class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :index]
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create!(email: params[:email], password: params[:password])

    render json: user
  end
end
