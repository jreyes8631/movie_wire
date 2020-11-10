class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
      @movies = current_user.movies   
    end

    def new
       @movie = Movie.new
    end
    
    def show
      @movies = current_user.movies.find(params[:id])
    end

    def edit
    set_movie
    end

    def create
      @movie = current_user.movies.build(movie_params)
      if @movie.save
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
     @movie.destroy
     redirect_to movies_path
    end


    private

    def set_movie
       @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :user_id)
    end

end
