class Post < ApplicationRecord
  belongs_to :users, class_name: 'User'
  has_many :comments, class_name: "Comment", foreign_key: "post_id"
end
