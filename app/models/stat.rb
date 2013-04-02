class Stat < ActiveRecord::Base
  attr_accessible :user_id, :short_url_id

  belongs_to :short_url
  belongs_to :user
  belongs_to :tag_type

  def self.make_new_stat(short_url_id, current_id)
    Stats.create(short_url_id: short_url_id, user_id: current_id)
  end
end