class LinksController < ApplicationController
  def index
    # @redirect = params[:id]
    @redirect = Url.find_by_sql("Select link from urls where short = 'localhost:3000/links/" + params[:id] + "'")

    redirect_to(@redirect)
  end
end
