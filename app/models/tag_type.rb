class TagType < ActiveRecord::Base
  has_many :tags
  has_many :short_urls, :through => :tags
  has_many :long_urls, :through => :short_urls

  attr_accessible :type_of_tag
end