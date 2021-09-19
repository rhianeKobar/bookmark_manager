#!/usr/bin/ruby

require 'pg'

class Bookmarks
	
  def self.all 
    begin

			if ENV['RACK_ENV'] == 'test' 
				conn = PG.connect('localhost','5432','','','bookmark_manager_test','postgres','postgres')
			else
				conn = PG.connect('localhost','5432','','','bookmark_manager','postgres','postgres')
			end

			rs = conn.exec "SELECT * FROM bookmarks"	
			rs.map{|row| {url: row['url'], title: row['title']}}
		
		rescue PG::Error => e
		
			puts e.message
		
		ensure
		
			rs.clear if rs
			conn.close if conn
		
		end
  end
	
	def self.create(link, title)
		begin

			if ENV['RACK_ENV'] == 'test' 
				conn = PG.connect('localhost','5432','','','bookmark_manager_test','postgres','postgres')
			else
				conn = PG.connect('localhost','5432','','','bookmark_manager','postgres','postgres')
			end

			conn.exec "INSERT INTO bookmarks(url,title)VALUES('#{link}','#{title}');"	
		
		rescue PG::Error => e
		
			puts e.message
		
		ensure

			conn.close if conn
		
		end
	end
end
