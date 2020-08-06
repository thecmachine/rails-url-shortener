class UrlsController < ApplicationController
    before_action :logged_in_user, only: [:new]
    def new
        @link = "www.test.com"
        @stub = "www.t.com"
        @short = "t.com"
    end
end
