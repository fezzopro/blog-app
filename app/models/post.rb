class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_save :update_post_counter

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: 'desc').limit(limit)
  end

  private :update_post_counter
end
