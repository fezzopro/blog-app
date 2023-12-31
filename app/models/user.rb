class User < ApplicationRecord
  before_validation :set_initial_post_counter, on: :create

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  validates :name, presence: true
  validates :post_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent_posts(limit = 3)
    posts.order(created_at: 'desc').limit(limit)
  end

  def set_initial_post_counter
    self.post_counter = 0
  end

  private :set_initial_post_counter
end
