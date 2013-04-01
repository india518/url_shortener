class ShortUrl < ActiveRecord::Base
  attr_accessible :name, :user_id, :long_url_id

  belongs_to :long_url
  belongs_to :user
  has_many :stats
  has_many :tags
  has_many :comments

  def num_visits
    Stat.where(user_id: self.user_id, short_url_id: self.id).count
  end

end