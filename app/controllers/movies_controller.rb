class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
      @movies = Movie.all
      
    end

    def current_user_movies
      @movies = current_user.movies
    end

    def current_user_reviews
     @reviews = current_user.reviews
    end

    def new
      @movie = Movie.new
    end
    
    def show
      @reviews = @movie.reviews.most_recent
    end

    def edit
      if @movie.user.id == current_user.id
        render :edit
      else
        flash[:notice] = "You are not the owner of this Movie"
        redirect_to movie_path(@movie)
      end
    end

    def create
      @movie = current_user.movies.build(movie_params)
      if @movie.save
        flash[:notice] = "Movie created succesfully"
        redirect_to movie_path(@movie)
      else
        render :new
      end
    end

    def update
       if @movie.update(movie_params)
         redirect_to movie_path(@movie)
       else
         render :edit 
       end
    end

    def destroy
     if @movie.user.id == current_user.id
        @movie.destroy
        flash[:notice] = "Movie Deleted succesfully"
       redirect_to movies_path
     else
       flash[:notice] = "You are not the owner of this Movie"
       redirect_to movie_path(@movie)
     end

    end


    private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :user_id)
    end

end
