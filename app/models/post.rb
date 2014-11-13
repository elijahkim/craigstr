class Post < ActiveRecord::Base
  belongs_to :region
  belongs_to :user

  def owned_by?(user)
    self.user == user
  end

  def mark_as_spam!
    self.spam = true 
    self.save
  end
end
