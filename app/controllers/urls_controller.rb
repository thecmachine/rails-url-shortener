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
            @url.short = "localhost:3000/links/" + bijective_encode(@url.short)
        else
            @url.short = "localhost:3000/links/" + @url.short
        end

        if @url.save!
            flash[:success] = "Url Saved!"
            redirect_to @url
        else
            render 'index'
        end
    end

    ALPHABET =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
    # make your own alphabet using:
    # (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join

    def bijective_encode(i)
        # from http://refactormycode.com/codes/125-base-62-encoding
        # with only minor modification
        return ALPHABET[0] if i == 0
        s = ''
        base = ALPHABET.length
        while i.length > 0
            s << ALPHABET[i.modulo(base)]
            i /= base
        end
        s.reverse
    end

    def url_params
        params.require(:url).permit(:link, :stub, :short)
    end
end
