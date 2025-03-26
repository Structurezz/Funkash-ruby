require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'jwt'
require 'dotenv/load'
require_relative 'config/database'
require_relative 'models/user'
require 'json'

class RubyMysqlCrud < Sinatra::Base
SECRET_KEY = ENV['SECRET_KEY']

helpers do
  def generate_token(user)
    payload = { user_id: user.id, exp: Time.now.to_i + 3600 }
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def authorized_user
    token = request.env["HTTP_AUTHORIZATION"]&.split(' ')&.last
    puts "Received token: #{token}"

   
    if token
      puts "Token accepted: #{token}"
      
      return true 
    else
      halt 401, { error: "Unauthorized - No token provided" }.to_json
    end
  end
end 


before do
  if request.content_type == 'application/json'
    request.body.rewind  # In case someone already read it
    @request_payload = JSON.parse(request.body.read)
  end
end

post '/signup' do
  user = User.new(
    name: @request_payload['name'],
    email: @request_payload['email'],
    phone: @request_payload['phone'],
    password: @request_payload['password'],
    password_confirmation: @request_payload['password_confirmation']
  )

  if user.save
    { message: "User registered successfully", token: generate_token(user) }.to_json
  else
    halt 400, { error: user.errors.full_messages }.to_json
  end
end

post '/login' do
  user = User.find_by(email: @request_payload["email"])

  if user && user.authenticate(@request_payload["password"])
    token = generate_token(user) 
    puts "Generated token: #{token}"  
    { token: token, user: user }.to_json
  else
    halt 401, { error: "Invalid credentials" }.to_json
  end
end

get '/users' do
  authorized_user
  users = User.all
  users.to_json
end



put '/users/:id' do
    user = User.find(params[:id]) 
  
    
    updated_attributes = {}
    updated_attributes[:name] = @request_payload["name"] if @request_payload["name"]
    updated_attributes[:email] = @request_payload["email"] if @request_payload["email"]
    updated_attributes[:phone] = @request_payload["phone"] if @request_payload["phone"]
  
    if user.update(updated_attributes)
      user.to_json
    else
      halt 400, { error: user.errors.full_messages }.to_json
    end
  end
  
  

  put '/users/:id' do
    user = User.find(params[:id]) 
  
    
    updated_attributes = {}
    updated_attributes[:email] = @request_payload["email"] if @request_payload["email"]
    updated_attributes[:phone] = @request_payload["phone"] if @request_payload["phone"]
  
    if user.update(updated_attributes)
      user.to_json
    else
      halt 400, { error: user.errors.full_messages }.to_json
    end
  end
  

post '/reset-password' do
  user = User.find_by(email: @request_payload["email"])

  if user
    new_password = SecureRandom.hex(6)
    user.update(password: new_password)
    { message: "Your new password is #{new_password}" }.to_json
  else
    halt 404, { error: "User not found" }.to_json
  end
end

delete '/users/:id' do
  authorized_user
  user = User.find(params[:id]) 

  if user.destroy
    { message: "User deleted successfully" }.to_json
  else
    halt 500, { error: "Something went wrong" }.to_json
  end
end
end