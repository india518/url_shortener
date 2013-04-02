class MyValidator < ActiveModel::Validator
  def validate(record)
    current_user = record.user
    if current_user.short_urls.where("created_at > ?", 1.minutes.ago).count >= 5
      record.errors[:base] << "You've done too many, take a break"
    end
  end
end

class ShortUrl < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator

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
    test = ShortUrl.new({name: SecureRandom.urlsafe_base64(5),
      user_id: user_id, long_url_id: long_url_id})
    test.save!
    test
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