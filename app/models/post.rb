class Post < ApplicationRecord
  belongs_to :users, class_name: 'User'
  has_many :comments, class_name: 'Comment', foreign_key: 'comment_id'
end
