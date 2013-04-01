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

  def num_unique_users
    LongUrl.find(self.id).users.count
  end

  def num_unique_visits
    stat_hash = Stat.where(short_url_id: self.id).group(:short_url_id).count
    stat_hash[self.id]
  end

  def visits_in_last_10
    Stat.where(Time.now - created_at < 600,
    self.short_urls.id = short_url_id).count
  end

end