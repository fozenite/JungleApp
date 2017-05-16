class RatingsController < ApplicationController

  before_filter :deny_access, :unless => :logged_in?
  def create
    @product = Product.find params[:product_id]
    @rating  = Rating.new(review_params)
    @rating.product_id = @product.id
    @rating.user = current_user
    if (@rating.valid?)
        @rating.save
    else
      flash[:danger] = 'Rating post unsucessful. Try again. Please enter a valid rating and description'
    end
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.delete
    redirect_to "/products/#{params[:product_id]}"
  end

  private
    def review_params
      params.require(:rating).permit(
        :description,
        :rating
      )
    end

    protected

    def deny_access
      @product = Product.find params[:product_id]
      flash[:danger] = "You aren't authorized to write a review. Please log in"
      redirect_to "/products/#{@product.id}"
    end

end
