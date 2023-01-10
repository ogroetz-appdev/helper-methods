class MoviesController < ApplicationController
  def new
    @movie = Movie.new

    # render template: "movies/new"
  end

  def index
    matching_movies = Movie.all

    @movies = matching_movies.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html do
        # render template: "movies/index"
      end
    end
  end

  def show
    # @movie = Movie.where(id: params.fetch(:id))[0]
    # @movie = Movie.find_by(id: params.fetch(:id))
    @movie = Movie.find(params.fetch(:id))
    # render template: "movies/show"
  end

  def create
  #  @movie = Movie.new
    # @movie.title = params.fetch("title")
    # @movie.title = params.fetch(:movie).fetch(:title)
    # @movie.description = params.fetch("description")

    movie_attributes = params.require(:movie).permit(:title, :description)
    @movie = Movie.new(movie_attributes)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully."
    else
      # render template: "movies/new"
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))

    # render template: "movies/edit"
  end

  def update
    @movie = Movie.find(params.fetch(:id))

    @movie.title = params.fetch(:title)
    @movie.description = params.fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movie_url(@movie), notice: "Movie updated successfully."
    else
      redirect_to movie_url(@movie), alert: "Movie failed to update successfully."
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end
end
