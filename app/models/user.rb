class User < ActiveRecord::Base
  attr_accessible :username, :email

  has_many :short_urls
  has_many :long_urls, :through => :short_urls
  has_many :comments
  has_many :tags
  has_many :stats

  def initialize(id = nil)
    @id = id
  end

  def num_links
    self.short_urls.count
  end

  def make_comment(short_url_id, body)
    Comment.create([{user_id: id, short_url_id: short_url_id, body: body}])
  end

  def add_tag(short_url_id, tag_type_id)
    Tag.create([{short_url_id: short_url_id, tag_type_id: tag_type_id, user_id: id}])
  end
end