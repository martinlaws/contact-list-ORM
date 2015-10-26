require 'csv'

class ContactDatabase

  def initialize(choice)
    case choice
    when :new
    when :list
      list
    when :show
    when :find
    end
  end

  def new

  end

  def list
    @contacts = CSV.read('contacts.csv').each do |row| 
    puts row.inspect
    end
  end

  # CSV.open('contacts.csv', 'a') do |contact|
  # contact.array.each do |row_array|
  #   contact << row_array
  # end
end