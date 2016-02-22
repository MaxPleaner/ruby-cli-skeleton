require 'sqlite3'
require 'active_record'
require 'yaml'
require 'active_support/all'
require 'securerandom'

BasePath = "#{File.dirname(__FILE__)}/.."
DATABASE_FILENAME = "database.sqlite"
DATABASE_PATH = "#{BasePath}/#{DATABASE_FILENAME}"
SQLite3::Database.new(DATABASE_PATH)
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: DATABASE_PATH
)

class Migrations < ActiveRecord::Migration
  def up
    create_table :todos do |t|
      t.string :content
      t.boolean :completed
      t.timestamps null: false
    end
  end
  def down
    puts "backing up database".red_on_black if File.file?(DATABASE_PATH)
    loop { (`cp #{DATABASE_PATH} #{DATABASE_PATH}-#{SecureRandom.urlsafe_base64}.backup`; break) rescue next }
    sleep 0.5
    drop_table :todos
    puts "dropped todos table"
  end
end # Migrations

class Todo < ActiveRecord::Base
end