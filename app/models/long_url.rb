class LongUrl < ActiveRecord::Base
  attr_accessible :name

  has_many :short_urls
  has_many :users, :through => :short_urls
  has_many :comments, :through => :short_urls
  has_many :tags, :through => :short_urls
  has_many :stats, :through => :short_urls

  def self.make_short_url(url, user_id)
    LongUrl.create([{name: url}])
    current_id = LongUrl.find(:all, :order => "id desc", :limit => 1).first.id

    ShortUrl.make_entry(user_id, current_id)
    current_id
  end

  def visits_in_last_10
    Stat.where(Time.now - created_at < 600,
    self.short_urls.id = short_url_id).count
  end
end