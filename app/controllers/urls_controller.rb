class UrlsController < ApplicationController
    before_action :logged_in_user, only: [:new]

    def new
        @url = Url.new
        # @link = "www.test.com"
        # @stub = "www.t.com"
        # @short = "t.com"
    end

    def index
        @user = current_user
        @Urls = @user.urls
        render 'index'
    end

    def show
        @url = Url.find(params[:id])
        render 'index'
    end

    def delete
    end
    
    def create
        @url = Url.new(url_params)
        @url.user = current_user
        if @url.save!
            flash[:success] = "Url Saved!"
            redirect_to @url
        else
            render 'index'
        end
    end

    def url_params
        params.require(:url).permit(:link, :stub, :short)
    end
end
