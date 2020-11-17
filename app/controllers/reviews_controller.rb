class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :set_movie
    before_action :authenticate_user!
    
    def index
      @reviews = @movie.reviews.most_recent
    end
  
    def new
      @review = Review.new(movie_id: params[:movie_id])
    end
    
    def show
       
    end

    def edit
     if @review.user.id == current_user.id
        render :edit
      else
        flash[:notice] = "You are not the owener of this record"
        redirect_to movie_path(@movie)
      end
    end

    def create
      @review = current_user.reviews.build(review_params)
      @review.movie_id = @movie.id
      if @review.save
        flash[:success] = "Review created successfully"
        redirect_to @movie
      else
        render :new
      end
    end

    def update
       if @review.update(review_params)
        flash[:success] = "Review updated successfully"
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
      params.require(:review).permit(:rating, :comment, :user_id, :movie_id)
    end
end
