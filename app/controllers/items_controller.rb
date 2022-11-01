class ItemsController < ApplicationController

  def index 
    user = User.find_by(id: params[:user_id])
    
    if user
      render json: user.items
    elsif params[:user_id]
      render json: { error: "User not found"}, status: :not_found
    else
       items = Item.all
       render json: items, include: :user
    end 
  end 

  def show
    item = Item.find_by(id: params[:id])

    if item
    render json: item, include: :user
    else
      render json: { error: "User not found"}, status: :not_found
    end
  end

  def create
    user = User.find_by(id: params[:user_id])

    if user
      item = Item.create(name: params[:name], description: params[:description], price: params[:price], user_id: params[:user_id])
      render json: item, status: :created
    end
  end

end
