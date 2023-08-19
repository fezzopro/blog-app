require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Test User',
      bio: 'I am a test user',
      post_counter: 0
    )
  end

  describe 'User Validations' do
    it 'Should be valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'Should check to the name to not be empty' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Should check if post_counter is numeric' do
      subject.post_counter = 'test'
      expect(subject).to_not be_valid
    end

    it 'Should check if post_counter is less than 0' do
      subject.post_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should check if post_counter is greater than or equal to 0' do
      subject.post_counter = 0
      expect(subject).to be_valid
      subject.post_counter = 100
      expect(subject).to be_valid
    end

    it 'is valid without a photo' do
      subject.photo = ''
      expect(subject).to be_valid
    end

    it 'must return recent posts as per given arguments' do
      user = User.create(name: 'Test', photo: 'https://test.com', bio: 'For testing purpose', post_counter: 1)
      post1 = Post.create(author: user, title: 'post 1', text: 'Content 1', comments_counter: 1, likes_counter: 1)
      post2 = Post.create(author: user, title: 'Post 2', text: 'Content 2', comments_counter: 1, likes_counter: 1)
      post3 = Post.create(author: user, title: 'post 3', text: 'Content 3', comments_counter: 1, likes_counter: 1)
      expect(user.recent_posts).to eq([post3, post2, post1])
    end
  end
end
