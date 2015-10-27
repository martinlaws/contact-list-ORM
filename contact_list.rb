require_relative './contact'

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

    case choice
    when :new
      # puts "Please enter the new contact's id #:"
      # id = gets.chomp
      puts "Please enter the new contact's name:"
      name = gets.chomp
      puts "Please enter the new contact's email:"
      email = gets.chomp
      puts "Please enter the new contact's phone number(s):"
      phone = gets.chomp
      Contact.new(name, email, phone)
    when :list
      puts Contact.all
    when :show
      puts "Please enter your search ID:"
      term = gets.chomp
      Contact.show(term)
    when :find
      puts "Please enter your search string (id, full first and last name or email):"
      term = gets.chomp
      Contact.find(term)
    else
      Application.new
    end
  end
end

Application.new