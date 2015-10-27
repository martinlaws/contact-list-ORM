require 'csv'
require 'pry'

class Contact
 
  attr_accessor :name, :email

  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
    @new_contact = [@id, @name, @email]
    Contact.create(@new_contact)
  end
 
  # def to_s
  #   @contacts
  # end
 
  ## Class Methods
  class << self
    def create(new_contact)
      CSV.open("contacts.csv", "a") do |csv|
        csv << new_contact
      end #ends CSV.open do
      all
    end #ends create method
 
    def find(term)
      @term = term
      @match = CSV.read('contacts.csv', 'r').select { |row| row.include?(@term) }
      puts @match
    end
 
    def all
      @contacts = CSV.read('contacts.csv').each do |row| 
        puts row.inspect
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end