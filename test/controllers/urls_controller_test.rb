require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should not save a url without a link or user" do
    url = Url.new
    url.short = "localhost:3000//asdfasd"
    assert_not url.save, "Saved the url without a link or user"
  end

  test "should not save a url without a short or user" do
    url = Url.new
    url.link = "www.google.com"
    assert_not url.save, "Saved the url without a short or user"
  end

  test "should not save a url with a new user and no short" do
    user = User.new
    user.name = 'name'
    user.email = 'name@test.com'
    user.password = 'password'

    url = Url.new
    url.user = user
    url.link = "www.google.com"
    assert_not url.save, "Saved the url with a user without short"
  end

  test "should not save a url with a new user and no link" do
    user = User.new
    user.name = 'name'
    user.email = 'name@test.com'
    user.password = 'password'

    url = Url.new
    url.user = user
    url.short = (0...8).map { (65 + rand(26)).chr }.join
    assert_not url.save, "Saved the url with a user without link"
  end

  test "should save a url with a new user" do
    user = User.new
    user.name = 'name'
    user.email = 'name@test.com'
    user.password = 'password'

    url = Url.new
    url.user = user
    url.link = "www.google.com"
    url.short = (0...8).map { (65 + rand(26)).chr }.join
    assert url.save, "Saved the url with a user"
  end
end
