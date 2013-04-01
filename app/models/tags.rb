

class Tag < ActiveRecord::Base
  belongs_to :short_url
  belongs_to :user

  attr_accessible :tag_name
end