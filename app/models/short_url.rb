class ShortUrl < ActiveRecord::Base
  attr_accessible :name, :user_id, :long_url_id

  belongs_to :long_url
  belongs_to :user
  has_many :stats
  has_many :tags
  has_many :comments

  def num_visits
    self.stats.count
  end

  def num_unique_users
    LongUrl.find(self.id).users.count
  end

  def num_unique_visits
    self.stats.count('user_id', distinct: true)
  end

  def visits_in_last_10
    self.stats.select {|x| Time.now - x.created_at < 600 }.count
  end

end