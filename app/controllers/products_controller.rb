class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @ratings = Rating.where("product_id = #{@product.id}").order(created_at: :desc)
    @NewRating = Rating.new
  end




end
