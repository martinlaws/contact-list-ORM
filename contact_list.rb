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
    puts "    delete - delete a contact"
    choice = gets.chomp.to_sym

    case choice
    when :new
      puts "Please enter the new contact's first name:"
      firstname = gets.chomp
      puts "Please enter the new contact's last name:"
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
    when :find
      puts "Would you like to search by:"
      puts "    -f // First Name"
      puts "    -l // Last Name"
      choice = gets.chomp.to_sym
      case choice
      when :f
        puts "Please enter the first name you would like to search for:"
        term = gets.chomp
        puts ContactDatabase.find_by_firstname(term)
      when :l
        puts "Please enter the last name you would like to search for:"
        term = gets.chomp
        puts ContactDatabase.find_by_lastname(term)
      else
        Application.new
      end
    when :delete
      puts "Please enter the ID of the contact you would like to delete:"
      id = gets.chomp
      ContactDatabase.delete(id)
      puts "Contact deleted!"
    else
      Application.new
    end
  end
end

Application.new