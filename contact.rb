require 'pry'

class Contact

  attr_accessor :id, :firstname, :lastname, :email, :phone

  def initialize (id, firstname, lastname, email, phones)
    @id = id
    @firstname = firstname
    @lastname = lastname
    @email = email
    @phone = phones
  end
 
 # TODO - add ID
  def to_s
    "ID ##{@id} // #{@lastname}, #{@firstname} // #{@email} // #{phone.join(', ')}"
  end
 
  # Class Methods
  # class << self
    # def find(term)
    #   @term = term
    #   @match = (@@local_array.select { |row| row.include?(@term) })
    #   @match
    # end
 
    # def all
    #   @@local_array
    # end
    
    # def show(id)
    #   Contact.find(id)
    # end

  # end # ends class << self
end # ends Contact class