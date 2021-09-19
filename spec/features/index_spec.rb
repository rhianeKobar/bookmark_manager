# frozen_string_literal: true


feature 'Bookmarks' do
  scenario 'has an index page with a form to add bookmarks' do
    visit('/')
		fill_in('url', with: "http://www.youtube.com")
		click_button('submit')
		expect(page).to have_content("http://www.youtube.com")
  end
end
