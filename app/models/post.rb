class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'
  has_many :likes

  after_save :update_post_counter 

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end

  private :update_post_counter
end
