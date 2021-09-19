#!/usr/bin/ruby

require 'pg'

class Bookmarks

	def self.connect
		if ENV['RACK_ENV'] == 'test' 
			PG.connect('localhost','5432','','','bookmark_manager_test','postgres','postgres')
		else
			PG.connect('localhost','5432','','','bookmark_manager','postgres','postgres')
		end
	end
	
  def self.all 
    begin

			conn = connect

			rs = conn.exec "SELECT * FROM bookmarks"	
			rs.map{|row| {id: row['id'], url: row['url'], title: row['title']}}
		
		rescue PG::Error => e
		
			puts e.message
		
		ensure
		
			rs.clear if rs
			conn.close if conn
		
		end
  end
	
	def self.create(link, title)
		begin

			conn = connect
			conn.exec_params("INSERT INTO bookmarks(url,title)VALUES($1,$2);",[link,title])	
		
		rescue PG::Error => e
		
			puts e.message
		
		ensure

			conn.close if conn
		
		end
	end

	def self.delete(id)
		begin

			conn = connect
			conn.exec "DELETE FROM bookmarks WHERE id='#{id}'"

		rescue PG::Error => e

			puts e.message

		ensure

			conn.close if conn

		end
	end
end
