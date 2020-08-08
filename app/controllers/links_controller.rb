class LinksController < ApplicationController
  def index
    @redirect = params[:id]

    redirect_to(@redirect)
  end
end
