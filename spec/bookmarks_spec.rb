require 'bookmarks'

describe Bookmarks do
   
  describe '.all' do 
    it 'will return an array' do
			conn = PG.connect('localhost','5432','','','bookmark_manager_test','postgres','postgres')
			conn.exec "INSERT INTO bookmarks(url)VALUES('http://www.google.com'),('http://www.github.com'),('http://www.makersacademy.com')"
      bookmarks = Bookmarks.all
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.github.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end 
  end 
end