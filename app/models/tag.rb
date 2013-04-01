class Tag < ActiveRecord::Base
  belongs_to :short_url
  belongs_to :user
  belongs_to :tag_type

  attr_accessible :tag_type_id, :user_id, :short_url_id
end