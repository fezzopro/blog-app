require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Felix', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Software Developer.',
                          post_counter: 0, email: 'felix@gmail.com', password: '123456')
      @user2 = User.create(name: 'Chris', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Software Developer',
                           post_counter: 0, email: 'chris@gmail.com', password: '123456')
      @post = Post.create(author: @user, title: 'Hello One', text: 'This is my first post', likes_counter: 0,
                          comments_counter: 0)
      @comment1 = Comment.create(author: @user, post: @post, text: 'I like this post comment one')
      @comment2 = Comment.create(author: @user2, post: @post, text: 'I like this post comment two')
      @comment3 = Comment.create(author: @user2, post: @post, text: 'I like this post comment three')
      visit user_post_path(@user, @post)
    end
    it "renders the post's title" do
      expect(page).to have_content(@post.title)
    end
  end
end
