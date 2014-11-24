class Category < ActiveRecord::Base
  validates :name, presence: :true, uniqueness: :true
  validates :description, presence: :true

  has_many :category_relationships, dependent: :destroy
  has_many :posts, through: :category_relationships

  def ordered_posts(region)
    posts.where(region: region).order(created_at: :desc)
  end
end
