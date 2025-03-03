class OrdersController < ApplicationController
  # before_action :require_login

  def index
    orders = Order.all
    render json: orders
  end

  def show
    order = Order.find(params[:id])
    if order
      render json: order
    else
      render json: { error: 'Order not found' }, status: :not_found
    end
  end

  def create
    order = Order.create(item_name: params[:item_name], cancelled: params[:cancelled])

    render json: order
    puts @current_user
  end

  def destroy
    order = Order.find(params[:id])
    if order
      order.destroy
      render json: { message: 'Order deleted successfully' }, status: :ok
    else
      render json: { error: 'Order not found' }, status: :not_found
    end
    puts @current_user
  end

  def update
    order = Order.find(params[:id])
    order.update(item_name: params[:item_name], cancelled: params[:cancelled])

    render json: order
    puts @current_user
  end

  # private

  # def require_login
  #   unless logged_in?
  #     render json: { error: 'You must log in to access this function' }, status: :unauthorized
  #   end
  # end
end
