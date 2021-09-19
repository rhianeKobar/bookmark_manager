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
			rs.map{|row| "#{row['url']}"}
		
		rescue PG::Error => e
		
			puts e.message
		
		ensure
		
			rs.clear if rs
			conn.close if conn
		
		end
  end
	
	def self.create(link)
		begin

			if ENV['RACK_ENV'] == 'test' 
				conn = PG.connect('localhost','5432','','','bookmark_manager_test','postgres','postgres')
			else
				conn = PG.connect('localhost','5432','','','bookmark_manager','postgres','postgres')
			end

			conn.exec "INSERT INTO bookmarks(url)VALUES('#{link}')"	
		
		rescue PG::Error => e
		
			puts e.message
		
		ensure

			conn.close if conn
		
		end
	end
end
