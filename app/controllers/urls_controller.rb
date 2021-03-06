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
        @urls = Url.where(:user_id => @user.id)
        render 'index'
    end

    def show
        @url = Url.find(params[:id])
        render 'index'
    end

    def destroy
        @url = Url.find(params[:id])
        @url.delete();

        @user = current_user
        @urls = Url.where(:user_id => @user.id)
        render 'index'
    end
    
    def create
        @url = Url.new(url_params)
        @url.user = current_user
        if @url.short == ""
            @url.short = "localhost:3000/links/" + (0...8).map { (65 + rand(26)).chr }.join
        else
            @url.short = "localhost:3000/links/" + @url.short
        end

        if @url.save!
            flash[:success] = "Url Saved!"
            redirect_to action: 'index'
        else
            redirect_to action: 'index'
        end
    end

    def url_params
        params.require(:url).permit(:link, :stub, :short)
    end
end
