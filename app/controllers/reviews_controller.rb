class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    
    def index
      @reviews = current_user.reviews   
    end

    def new
       @review = Review.new
    end
    
    def show
      @reviews = current_user.reviews.find(params[:id])
    end

    def edit
    set_review
    end

    def create
      @review = current_user.reviews.build(review_params)
      if @review.save
        redirect_to review_path(@movie)
      else
        render :new
      end
    end

    def update
       
       if @review.update(review_params)
         redirect_to review_path(@review)
       else
         render :edit 
       end
    end

    def destroy
     @review.destroy
     redirect_to reviews_path
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
