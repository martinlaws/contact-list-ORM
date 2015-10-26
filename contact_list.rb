require_relative './contact'
require_relative './contact_database'

# TODO: Implement command line interaction
class Application
  def initialize
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts
    puts "Here is a list of available commands:"
    puts "    new  - Create a new contact"
    puts "    list - List all contacts"
    puts "    show - Show a contact"
    puts "    find - Find a contact"
    choice = gets.chomp.to_sym
    ContactDatabase.new(choice)
  end
end

Application.new