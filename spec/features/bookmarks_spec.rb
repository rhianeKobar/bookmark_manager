
feature 'bookmarks' do 
  scenario 'viewing bookmarks at the /bookmarks route' do
    visit ("/bookmarks")
    expect(page).to have_content('www.google.com')
    expect(page).to have_content('www.google.com')
    expect(page).to have_content('www.google.com')
  end
end