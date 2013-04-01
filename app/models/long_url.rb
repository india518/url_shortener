class LongUrl < ActiveRecord::Base
  attr_accessible :name

  has_many :short_urls
  has_many :users, :through => :short_urls
  has_many :comments, :through => :short_urls
  has_many :tags, :through => :short_urls
  has_many :stats, :through => :short_urls

  def self.make_short_url(user_id)
    ShortUrl.create([{name: SecureRandom.urlsafe_base64,
      user_id: user_id, long_url_id: self.id}])
  end

  def visits_in_last_10
    Stat.where(Time.now - created_at < 600,
    self.short_urls.id = short_url_id).count
  end
end