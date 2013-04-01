

class Tag < ActiveRecord::Base
  belongs_to :short_url
  belongs_to :user

end