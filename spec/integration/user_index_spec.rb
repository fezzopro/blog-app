require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  let(:users) do
    [
      User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                  bio: 'Teacher from Poland.', post_counter: 0, email: 'lilly@gmail.com', password: '123456'),
      User.create(name: 'John', photo: 'https://unsplash.com/photos/abc123',
                  bio: 'Engineer from USA.', post_counter: 2, email: 'John@gmail.com', password: '123456'),
      User.create(name: 'Alice', photo: 'https://unsplash.com/photos/xyz456',
                  bio: 'Artist from France.', post_counter: 5, email: 'Alice@gmail.com', password: '123456')
    ]
  end

  before do
    users
    visit users_path
  end

  scenario 'I can see the username, profile picture, and number of posts for each user' do
    users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_selector('img[alt="profile picture"]')
      expect(page).to have_content(user.post_counter)
    end
  end

  scenario 'When I click on a user, I am redirected to their show page' do
    users.each do |user|
      click_on user.name
      expect(current_path).to eq(user_path(user))
      visit users_path # Go back to the user index page for the next iteration
    end
  end
end
