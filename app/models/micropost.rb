class Micropost < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :wants_item, :presence => true, :length => { :maximum => 140 }
  validates :has_item, :presence => true, :length => { :maximum => 140 }
  validates :user_id, presence: true

  def self.feed_items(user)
    array = from_users_followed_by(user) + from_users_matched_with(user) + user.microposts
    where(id: array.map(&:id))
  end

  def self.from_users_matched_with(user)
    has_items = user.microposts.map(&:has_item)
    wants_items = user.microposts.map(&:wants_item)
    (user.site.microposts.where("wants_item IN (?)", has_items) + user.site.microposts.where("has_item IN (?)", wants_items)).uniq
  end

  # Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = Relationship.where(follower_id: user.id).map(&:followed_id)
    where("user_id IN (?)", followed_user_ids)
  end
end
