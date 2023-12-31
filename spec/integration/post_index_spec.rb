require 'rails_helper'
RSpec.describe 'Post Index Page', type: :feature do
  describe 'Viewing Post Index page' do
    before(:each) do
      @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.',
                           post_counter: 0, email: 'test@gmail.com', password: '123456')
      @first_post = Post.create(author: @user1, title: 'post1', text: 'This is my first post', comments_counter: 0,
                                likes_counter: 0)
      @comment1 = Comment.create(post: @first_post, author: @user1, text: 'Hi Tom!, Nice comment')
      visit user_posts_path(@user1)
    end

    it 'should show user name' do
      expect(page).to have_content(@user1.name)
    end

    it 'should show user photo' do
      expect(page).to have_selector('img[alt="profile picture"]')
    end

    it 'should show post_counter of clicked user' do
      expect(page).to have_content(@user1.post_counter)
    end

    it 'should show post title' do
      expect(page).to have_content(@first_post.title)
    end

    it 'should show post text' do
      expect(page).to have_content(@first_post.text)
    end

    it 'should show comment text' do
      expect(page).to have_content(@comment1.text)
    end

    it 'should show comments counter' do
      expect(page).to have_content(@first_post.comments_counter)
    end

    it 'should show likes counter' do
      expect(page).to have_content(@first_post.likes_counter)
    end

    it 'should redirect to post show page when clicking on post.' do
      click_link @first_post.title
      expect(page).to have_current_path(user_post_path(@user1, @first_post))
    end
  end
end
