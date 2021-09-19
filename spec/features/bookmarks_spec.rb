require 'db_helper'

feature 'bookmarks' do 
  scenario 'viewing bookmarks at the /bookmarks route' do
		add_bookmarks
		visit ("/bookmarks")
    expect(page).to have_link("youtube", href:"http://www.youtube.com")
  end

	scenario "removes a bookmark" do
		add_bookmarks
		click_button("delete youtube bookmark")
		expect(page).not_to have_link("youtube", href:"http://www.youtube.com")
	end
end