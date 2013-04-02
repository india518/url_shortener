class Tag < ActiveRecord::Base
  belongs_to :short_url
  belongs_to :user
  belongs_to :tag_type

  validates :tag_type_id, :presence => true
  validates :tag_type_id, :format => { :with => /[1-3]/}

  attr_accessible :tag_type_id, :user_id, :short_url_id
end