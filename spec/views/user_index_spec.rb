require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'img.jpg', bio: 'Developer', post_counter: 0)
    @user.save
    visit users_path
  end
  it 'shows the username' do
    expect(page).to have_content('Tom')
  end
  it 'shows the users profile picture when clicked' do
    expect(page).to have_css("img[src*='img.jpg']")
  end
  it 'shows Post Counter of user' do
    expect(page).to have_content('Number of Posts: 0')
  end
  it 'redirects to that users show page when a user clicked' do
    click_link('More info', match: :prefer_exact)
    expect(page).to have_content('Bio')
  end
end
