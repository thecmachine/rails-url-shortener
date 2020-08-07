class UrlsController < ApplicationController
    before_action :logged_in_user, only: [:new]
    def new
        # @url = Url.new
        @link = "www.test.com"
        @stub = "www.t.com"
        @short = "t.com"
    end

    def shorten
    end

    def delete
    end
    
    def create
        @url = Url.new(url_params)
        if @url.save
            flash[:success] = "Url Saved!"
            redirect_to @url
        else
            render 'new'
        end
    end

    def url_params
        params.require(:url).permit(:link, :stub, :short)
    end
end
