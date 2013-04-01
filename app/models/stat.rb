class Stat < ActiveRecord::Base
  attr_accessible :user_id, :short_url_id

  belongs_to :short_url
  belongs_to :user
  belongs_to :tag_type
end