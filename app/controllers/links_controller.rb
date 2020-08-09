class LinksController < ApplicationController
  def index
    @redirect = Url.find_by_sql("Select link from urls where short = 'localhost:3000/links/" + params[:id] + "'")
    @redirect = @redirect[0].link
    @link = "http://" + @redirect
    redirect_to @link
  end
end
