require 'pg'

def add_bookmarks
	Bookmarks.create("http://www.youtube.com","youtube")
	Bookmarks.create("http://www.google.com","google")
	Bookmarks.create("http://www.makersacademy.com","makers")
	Bookmarks.all
end