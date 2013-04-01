

class LongUrL < ActiveRecord::Base
  has_many :short_urls
  has_many :users, :through => :short_urls
  has_many :comments, :through => :short_urls
  has_many :tags, :through => :short_urls
  has_many :stats, :through => :short_urls

  attr_accessible :long_url_name
end