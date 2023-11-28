# main.rb

require_relative 'Classes/item'

def print_menu
  puts '1 Move item to archive'
  puts '2 Quit'
end

def get_user_input(prompt)
  print prompt
  gets.chomp
end
