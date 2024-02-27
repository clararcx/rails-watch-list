class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def create
    @bookmarks = Bookmark.new(bookmarks_params)
    @list = List.find(params[:list_id])
    @bookmarks.list = @list
    @bookmarks.save

    redirect_to list_path(@list)
  end

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

def set_list
  @list = List.find(params[:list_id])
end

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
