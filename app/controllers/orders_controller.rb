class OrdersController < ApplicationController
  def index
    orders = Order.all
    render json: orders
  end

  def show
    order = Order.find(id: params[:id])
    if order
      render json: order
    else
      render json: { error: 'Order not found' }, status: :not_found
    end
  end

  def create
    order = Order.create(item_name: params[:item_name], cancelled: params[:cancelled])

    render json: order
  end

  def destroy
    order = Order.find(id: params[:id])
    if order
      order.destroy
      render json: { message: 'Order deleted successfully' }, status: :ok
    else
      render json: { error: 'Order not found' }, status: :not_found
    end
  end

  def update
    order = Order.find(id: params[:id])
    order.update(item_name: params[:item_name], cancelled: params[:cancelled])

    render json: order
  end
end
