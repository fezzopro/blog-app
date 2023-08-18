require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'Should update likes_counter by 1 on every new like' do
    user = User.create(name: 'Test User', photo: '', bio: 'Test User Bio', post_counter: 0)
    post1 =
      Post.create(author: user, title: 'Test Title', text: 'Test Post Content', comments_counter: 1, likes_counter: 1)

    Like.create(post: post1, author: user)
    expect(post1.likes_counter).to eq(1)

    Like.create(post: post1, author: user)
    expect(post1.likes_counter).to eq(2)
  end
end
