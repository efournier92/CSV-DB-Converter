require 'pg'
require 'csv'

SEP = "***********************************************"

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

puts "\n#{SEP}"

db_connection do |conn|
  conn.exec("SELECT * FROM ingredients").each do |info|
    puts "#{info["id"]}. #{info["name"]}"
  end
end

puts "#{SEP}\n\n"
