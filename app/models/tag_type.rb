class TagType < ActiveRecord::Base
  has_many :tags

  attr_accessible :type_of_tag
end