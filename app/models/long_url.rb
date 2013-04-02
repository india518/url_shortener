class LongUrl < ActiveRecord::Base
  attr_accessible :name

  has_many :short_urls
  has_many :users, :through => :short_urls
  has_many :comments, :through => :short_urls
  has_many :tags, :through => :short_urls
  has_many :stats, :through => :short_urls

  validates :name, :presence => true
  validates :name, :length => { maximum: 1024 }

  def self.make_short_url(url, user_id)
    current_id = LongUrl.find(:all, :order => "id desc", :limit => 1).first.id

    ShortUrl.make_entry(user_id, current_id)
    current_id
  end

  def visits_in_last_10
    self.stats.where("created_at > ?", 10.minutes.ago).count
  end
end