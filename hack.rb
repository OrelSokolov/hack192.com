require "watir"

browser = Watir::Browser.new 


scroll = File.read('scrollto.js')

query = 'Hm'
location = 'London'
browser.goto '192.com'
browser.text_field( :id, "peopleBusinesses_name" ).set( query )
browser.text_field( :id, "where_location" ).set( location )

browser.button( :value, "Search" ).click
browser.execute_script scroll
Watir::Wait.until(180) { browser.text.include? 'CONTENT IS LOADED. WHOOHOO!' }
puts 'done'
browser.close
