
feature 'bookmarks' do 
  scenario 'viewing bookmarks at the /bookmarks route' do
		conn = PG.connect('localhost','5432','','','bookmark_manager_test','postgres','postgres')
		conn.exec "INSERT INTO bookmarks(url)VALUES('http://www.google.com'),('http://www.github.com'),('http://www.makersacademy.com')"
    visit ("/bookmarks")
    expect(page).to have_content('http://www.google.com')
  end
end