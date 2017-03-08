class Tag < ActiveRecord::Base
  has_many :resource_tags
end
