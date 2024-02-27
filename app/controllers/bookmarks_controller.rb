class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def create
    @bookmarks = Bookmark.new(bookmarks_params)
    @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id_id])
    @bookmarks.list = @list
    @bookmarks.movie = @movie
    @bookmarks.save

    redirect_to list_path(@list)
  end

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  private

def set_list
  @list = List.find(params[:list_id])
end

  def bookmarks_params
    params.require(:bookmark).permit(:comment)
  end
end
