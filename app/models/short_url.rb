

class ShortUrL < ActiveRecord::Base
  belongs_to :long_url
  belongs_to :user
  has_many :stats
  has_many :tags
  has_many :comments


  attr_accessible :short_url_name

end