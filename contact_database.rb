require 'csv'

class ContactDatabase

  def initialize(choice)
    case choice
    when :new
      puts "Please enter the new contact's id #:"
      id = gets.chomp
      puts "Please enter the new contact's name:"
      name = gets.chomp
      puts "Please enter the new contact's email:"
      email = gets.chomp
      Contact.new(id, name, email)
    when :list
      Contact.all
    when :show
    when :find
      puts "Please enter your search string (id, full first and last name or email):"
      term = gets.chomp
      Contact.find(term)
    end
  end

  # CSV.open('contacts.csv', 'a') do |contact|
  # contact.array.each do |row_array|
  #   contact << row_array
  # end
end