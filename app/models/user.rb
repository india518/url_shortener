class User < ActiveRecord::Base
  attr_accessible :username, :email

  has_many :short_urls
  has_many :long_urls, :through => :short_urls
  has_many :comments
  has_many :tags
  has_many :stats

  def num_links
    ShortUrl.where(user_id: id).count
  end

  def make_comment(short_url_id, body)
    Comment.create([{user_id: id, short_url_id: short_url_id, body: body}])
  end
end