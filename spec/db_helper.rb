require 'pg'

def add_bookmarks
	conn = PG.connect('localhost','5432','','','bookmark_manager_test','postgres','postgres')
	Bookmarks.create("http://www.youtube.com","youtube")
	Bookmarks.create("http://www.google.com","google")
	Bookmarks.create("http://www.makersacademy.com","makers")
	Bookmarks.all
end