require 'csv'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      CSV.read('contacts.csv')
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      last_id = CSV.read('contacts.csv').last[0]
      row_array = [last_id+1,name,email]
      CSV.open('contacts.csv', 'a') do |csv_object|
      csv_object << row_array
      end
      row_array
    end
 

    #Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      CSV.foreach("contacts.csv") do |row|
        return row if row[0] == id  
      end
      return nil
    
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      contacts_array =[]
      CSV.foreach("contacts.csv") do |row|
        contacts_array <<row if row[1].match(term) || row[2].match(term)
      end
      contacts_array
    end

  end

end