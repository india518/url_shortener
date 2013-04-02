class ShortUrl < ActiveRecord::Base
  attr_accessible :name, :user_id, :long_url_id

  belongs_to :long_url
  belongs_to :user
  has_many :stats
  has_many :tags
  has_many :comments

  validates :name, :presence => true

  def num_visits
    self.stats.count
  end

  def self.make_entry(user_id, long_url_id)
    ShortUrl.create([{name: SecureRandom.urlsafe_base64(5),
      user_id: user_id, long_url_id: long_url_id}])
  end

  def num_unique_users
    LongUrl.find(self.id).users.count
  end

  def num_unique_visits
    self.stats.count('user_id', distinct: true)
  end

  def visits_in_last_10
    self.stats.where("created_at > ?", 10.minutes.ago).count
  end

  def display_comments
    self.comments.each { |comment| puts comment.body }
  end

end