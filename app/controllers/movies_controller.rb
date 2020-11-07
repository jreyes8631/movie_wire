class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]

    def index 
       @movies = Movie.all
    end

    def new
       @movie = Movie.new
    end
    
    def show
      @movies = Movie.all
    end

    def edit

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
       @movie.update(movie_params)
       if @movie.update!
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
       @movie = Movie.find_by(id: params[:id])
    end

    def movie_params
        params.require(:movie).permit(:title, :description, :movie_length, :director, :rating)
    end

end
