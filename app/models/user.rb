

class User < ActiveRecord::Base
  attr_accessible :username, :email

  has_many :short_urls
  has_many :long_urls, :through => :short_urls
  has_many :comments
  has_many :tags
  has_many :stats
end