require 'bookmarks'
require 'db_helper'

describe Bookmarks do
   
  describe '.all' do 
    it 'will return an array' do
			bookmarks = add_bookmarks
			expect(bookmarks.length).to eq 3
			expect(bookmarks[0][:url]).to eq "http://www.youtube.com"
			expect(bookmarks[0][:title]).to eq "youtube"
		end
  end 
	describe '.create' do
		it "adds a new bookmark" do
			bookmarks = add_bookmarks
      expect(bookmarks[0][:url]).to eq "http://www.youtube.com"
		end
	end
end