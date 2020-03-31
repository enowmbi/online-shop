class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]

    if @review.save 
      redirect_to product_path(params[:product_id]),notice: "Product review was saved"
    else
      render :new
    end
  end

  def edit 


  end 

  def update

  end

  private 
  def set_product

  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment,:rating, :product_id)
  end


end

