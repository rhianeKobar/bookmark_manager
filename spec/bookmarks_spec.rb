require 'bookmarks'

describe Bookmarks do
   
  describe '.all' do 
    it 'will return an array' do
      bookmarks = Bookmarks.all
      expect(bookmarks).to include("www.google.com")
      expect(bookmarks).to include("www.meteo.com")
      expect(bookmarks).to include("www.youtube.com")
    end 
  end 
end