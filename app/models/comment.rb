

class Comment < ActiveRecord::Base
  belongs_to :short_url
  belongs_to :user

  validates :body, :presence => true

  attr_accessible :body, :user_id, :short_url_id
end