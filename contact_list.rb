require_relative 'contact'
require_relative 'contact_database'


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
      puts "Please enter the new contact's first name:"
      firstname = gets.chomp
      puts "Please enter the new contact's first name:"
      lastname = gets.chomp
      puts "Please enter the new contact's email:"
      email = gets.chomp
      puts "Please enter the new contact's phone number(s):"
      phone = gets.chomp
      c = Contact.new(nil, firstname, lastname, email, [phone])
      ContactDatabase.save(c)
      puts "Contact added!"
    when :list
      puts ContactDatabase.all
    when :show
      puts "Please enter your search ID:"
      id = gets.chomp
      puts ContactDatabase.find(id)
    # when :find
    #   puts "Please enter your search string (id, full first and last name or email):"
    #   term = gets.chomp
    #   puts Contact.find(term)
    else
      Application.new
    end
  end
end

Application.new