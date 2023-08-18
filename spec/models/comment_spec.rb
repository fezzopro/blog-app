require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.create(name: 'test', photo: 'https://test.com', bio: 'For test purpose', post_counter: 0)
    post1 = Post.create(author: user, title: 'Post 1', text: 'Post content 1', comments_counter: 1, likes_counter: 1)
    Comment.new(
      author: user,
      post: post1,
      text: 'Test comment'
    )
  end

  describe 'Comment Validations' do
    it 'Should be valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'Should be invalid without proper attributes' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end
  describe 'Comment tests suit' do
    it 'Should update Post\'s comments_counter by 1 for new comment entry' do
      user = User.create(name: 'test', photo: 'https://test.com', bio: 'For test purpose', post_counter: 0)
      post1 = Post.create(author: user, title: 'Post 1', text: 'Post content 1', comments_counter: 1, likes_counter: 1)

      Comment.create(post: post1, author: user, text: 'text1')
      expect(post1.comments_counter).to eq(1)

      Comment.create(post: post1, author: user, text: 'text2')
      expect(post1.comments_counter).to eq(2)
    end
  end
  
end
