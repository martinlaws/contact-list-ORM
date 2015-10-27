require_relative './contact_database'
require 'pry'

class Contact
@@local_array = ContactDatabase.load_file

  attr_accessor :id, :name, :email, :phone

  def initialize (name, email, phone)
    @id = (ContactDatabase.all.length + 1)
    @name = name
    @email = email
    @phone = Array.new()
    @phone.push(phone.to_i)
    @new_contact = [@id, @name, @email, @phone]
    ContactDatabase.save_file(@new_contact)
  end
 
  def to_s
    puts row.inspect.join('#')
  end
 
  ## Class Methods
  class << self

    def find(term)
      @term = term
      @match = (@@local_array.select { |row| row.include?(@term) })
      puts @match.join('#')
    end
 
    def all
      puts ContactDatabase.load_file
    end
    
    def show(id)
      ContactDatabase.find(id)
    end
  end
end