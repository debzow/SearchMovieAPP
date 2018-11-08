class MoviesController < ApplicationController
  
  def search
  end

  def result
    @result = SearchMovie.new.search(params[:search])
  end

end
