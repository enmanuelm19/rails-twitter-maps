require 'rails_helper'

feature 'Videos' do
  scenario 'user visits video list' do
    visit root_path
    expect(page).to have_content('Listing Videos')
  end

  scenario 'user select a video' do
    FactoryBot.create(:video)
    visit root_path
    click_link("video_#{Video.first.id}")
    expect(page.status_code).to eq(200)
    expect(page).to have_content(Video.first.title)
  end
end
