#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' 

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a> !!!"			
end

get '/about' do 
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@username.capitalize!
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	@message = "#{@username}, мы Вас записали!"

	f = File.open './public/users.txt', 'a'
	f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}, Barber: #{@barber}, Color: #{@color}\n"
	f.close

	erb :visit
end	

get '/contacts' do
	erb :contacts
end	

post '/contacts' do
	@e_mail = params[:e_mail]
	@text = params[:text]
	
	@message2 = "Отправленно"

	d = File.open './public/contacts.txt', 'a'
	d.write "E-mail: #{@e_mail}, SMS: #{@text}\n"
	d.close

	erb :contacts
end	