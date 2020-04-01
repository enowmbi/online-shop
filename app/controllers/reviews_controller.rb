class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_product, only: [:new, :edit]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]

    if @review.save 
      redirect_to product_path(@review.product),notice: "Product review was saved"
    else
      render :new
    end
  end

  def edit 
  end 

  def update
    if @review.update(review_params)
      redirect_to product_path(@review.product),notice: "Review was successfully updated"
    else
      render :edit
    end
  end

  def destroy
     @review.destroy
     redirect_to product_path(@review.product),alert: "Review has been destroyed"
  end

  private 
  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment,:rating, :product_id)
  end


end

