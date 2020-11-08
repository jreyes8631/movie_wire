class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :set_movie
    before_action :authenticate_user!
    
    def index
      @reviews = Review.all
    end

    def new
        @review = Review.new
    end

    def edit

    end

    def create
     @review = Review.new(review_params)
     if @review.save
        redirect_to review_path(@review)
     else
        render :new
     end
    end

    def update 
       @review.update(review_params)
    end
    
    def destroy
      @review.destroy
    end



  private

    def set_review
        @review = Review.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
