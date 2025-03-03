class SubscriptionsController < ApplicationController
  # before_action :require_login

  def index
    subscriptions = Subscription.all
    render json: subscriptions
  end

  def show
    subscription = Subscription.find(params[:id])
    if order
      render json: subscription
    else
      render json: { error: 'Subscription not found' }, status: :not_found
    end
  end

  def create
    subscription = Subscription.create(name: params[:name], cancelled: params[:cancelled])

    render json: subscription
    puts @current_user
  end

  def destroy
    subscription = Subscription.find(params[:id])
    if subscription
      subscription.destroy
      render json: { message: 'Subscription deleted successfully' }, status: :ok
    else
      render json: { error: 'Subscription not found' }, status: :not_found
    end
    puts @current_user
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update(name: params[:item_name], cancelled: params[:cancelled])

    render json: subscription
    puts @current_user
  end

  # private

  # def require_login
  #   unless logged_in?
  #     render json: { error: 'You must log in to access this function' }, status: :unauthorized
  #   end
  # end
end
