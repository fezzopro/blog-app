require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Test User', post_counter: 0) }
  subject do
    Post.new(author_id: user.id, title: 'Test Post', text: 'Test Post Content', comments_counter: 1, likes_counter: 1)
  end

  context 'Comment validation test suit' do
    it 'Should be invalid with title=nil' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Title should not exceed 250 characters' do
      expect(subject.title.length).to be <= 250
    end

    it 'Should have an integer comments_counter, greater than or equal to zero.' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should be invalid for likes_counter less than zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should be valid for likes_counter greater than, or equal to zero' do
      subject.likes_counter = 1
      expect(subject).to be_valid
    end
  end

  context 'Method tests suit' do
    it 'Should return recent comments as per given arguments' do
      user = User.create(name: 'Test User', photo: 'image_url', bio: 'For Testing Purpose', post_counter: 0)
      post1 =
        Post.create(author: user, title: 'Post Title', text: 'Post Text Content', comments_counter: 1, likes_counter: 1)
      comment1 = Comment.create(post: post1, author: user, text: 'First Comment')
      comment2 = Comment.create(post: post1, author: user, text: 'Second Comment')
      comment3 = Comment.create(post: post1, author: user, text: 'Third Comment')
      expect(post1.recent_comments).to eq([comment3, comment2, comment1])
    end

    it 'Should update post counter by 1 on every new post' do
      user = User.create(name: 'Test User', photo: 'image_url', bio: 'For Testing Purpose', post_counter: 0)
      Post.create(author: user, title: 'Post Title', text: 'Post Text Content', comments_counter: 1, likes_counter: 1)
      expect(user.post_counter).to eq(1)
      Post.create(author: user, title: 'Post Title', text: 'Post Text Content', comments_counter: 1, likes_counter: 1)
      expect(user.post_counter).to eq(2)
    end
  end
end
