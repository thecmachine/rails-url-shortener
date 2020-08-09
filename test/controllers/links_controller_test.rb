require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should redirect user to link" do
    user = User.new
    user.name = 'name'
    user.email = 'name@test.com'
    user.password = 'password'
    user.save

    url = Url.new
    url.user = user
    url.link = "www.google.com"
    url.short = "localhost:3000/links/" + (0...8).map { (65 + rand(26)).chr }.join
    url.save

    urllink = Url.find_by_sql("Select link from urls where short = '" + url.short + "'")
    urllink = urllink[0].link
    link = "http://" + urllink
    assert_equal("http://www.google.com", link)
  end
  test "should redirect user to link are not equal" do
    user = User.new
    user.name = 'name'
    user.email = 'name@test.com'
    user.password = 'password'
    user.save

    url = Url.new
    url.user = user
    url.link = "www.test.com"
    url.short = "localhost:3000/links/" + (0...8).map { (65 + rand(26)).chr }.join
    url.save

    urllink = Url.find_by_sql("Select link from urls where short = '" + url.short + "'")
    urllink = urllink[0].link
    link = "http://" + urllink
    assert_not_equal("http://www.google.com", link)
  end
end
