require 'pg'
require 'csv'
require 'pry'

SEP = "***********************************************"

=begin
CLI SETUP:

CREATE DATABASE ingredients;

CREATE TABLE ingredients (
id SERIAL PRIMARY KEY,
name VARCHAR(100)
);

COPY ingredients(id, name)
FROM '/Users/Misigno/Challenges/csv-to-db/ingredients.csv' DELIMITER ',' CSV;
=end

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
