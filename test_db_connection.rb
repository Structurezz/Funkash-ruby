require 'active_record'
require 'mysql2'
require 'dotenv/load'

puts "Connecting to database with the 
following settings:"
puts "Host: #{ENV['DATABASE_HOST']}"
puts "Username: 
#{ENV['DATABASE_USER']}"
puts "Database Name: 
#{ENV['DATABASE_NAME']}"
puts "Port: #{ENV['DB_PORT']}"

ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: ENV['DATABASE_HOST'],
  username: ENV['DATABASE_USER'],
  password: ENV['DATABASE_PASSWORD'],
  database: ENV['DATABASE_NAME'],
  port: ENV['DB_PORT']
)

begin
  ActiveRecord::Base.connection
  puts "Connected to the database 
successfully!"
rescue 
ActiveRecord::ConnectionNotEstablished => e
  puts "Connection failed: 
#{e.message}"
end

