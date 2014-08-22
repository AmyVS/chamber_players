require 'bundler/setup'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

def welcome
  system('clear')
  puts "*" * 27
  puts "Welcome to Chamber Players!"
  puts "*" * 27
  main_menu
end

def main_menu
  puts "\nPlease select from the following choices:"
  puts "[p] to add a new piece"
  puts "[m] to add a new musician"
  puts "[x] to exit"

  choice = gets.chomp
  case choice
  when 'p'
    add_piece
  when 'm'
    add_musician
  when 'x'
    puts "\nUntil next time!"
    exit
  else
    puts "Invalid option, please try again."
    main_menu
  end
end

welcome
