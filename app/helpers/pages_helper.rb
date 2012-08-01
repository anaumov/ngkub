module PagesHelper
  def get_tweets(number)
    @tweets = Twitter.user_timeline("novgaz_kuban", :count => number)
    return @tweets
  end
end
