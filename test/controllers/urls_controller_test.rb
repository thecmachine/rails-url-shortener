require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should not save a url without a link" do
    url = Url.new
    url.short = "localhost:3000//asdfasd"
    assert_not url.save, "Saved the project without a link"
  end

  test "should not save a url without a short" do
    url = Url.new
    url.link = "www.google.com"
    assert_not url.save, "Saved the project without a link"
  end
end
