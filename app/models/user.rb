class User < ActiveRecord::Base
  has_many :resources, foreign_key: :teacher_id
  has_many :likes, foreign_key: :liker_id
  has_many :liked_resources, through: :likes, source: :resource

  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: true

  # def user_likes(current_user, resource_id)
  #   likes.find(:first, :conditions => ['user_id = ? AND post_id = ?', current_user, post_id] ).nil?
  # end
end
