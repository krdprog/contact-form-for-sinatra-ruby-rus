require 'sinatra'
require 'sqlite3'

# Method connect with database
def get_db
	return SQLite3::Database.new 'base.db'
end

# Configure application
configure do
	db = get_db
	db.execute 'CREATE TABLE IF NOT EXISTS "Messages"
	  (
		  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
		  "username" TEXT,
		  "phone" TEXT,
		  "email" TEXT,
		  "option" TEXT,
		  "comment" TEXT
		)'
	db.close
end

# Method save form data to database
def save_form_data_to_database
	db = get_db
	db.execute 'INSERT INTO Messages (username, phone, email, option, comment)
	VALUES (?, ?, ?, ?, ?)', [@username, @phone, @email, @option, @comment]
	db.close
end

# Index page with form
get '/' do
	@title = "Форма заявки для Sinatra (Ruby)"
	erb :index
end

post '/' do
	@username = params[:username]
	@phone = params[:phone]
	@email = params[:email]
	@option = params[:option]
	@comment = params[:comment]

	save_form_data_to_database

	@title = "Спасибо, ваше сообщение отправлено"
	erb :sent
end

# TODO:
# - сделать метод валидации форм
# - сделать метод отправки на почту
# - сделать английскую версию программы
# - сделать поле прикрепления файла
# - сделать страницу отображения отправленных данных (вход для администратора)
