require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  #new list show search
  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  case ARGV[0]
  
  when nil 
    puts "Here is a list of avaiable commands:"
    puts "new : create a new contact"
    puts "show : show a contact"
    puts "search: search a contact"
  
  when "new"
    puts "Please enter full name"
    fullname = STDIN.gets.chomp
    puts "Please enter email"
    email = STDIN.gets.chomp
    puts "New contact with id #{Contact.create(fullname,email)[0]} created successfully!"

  when "list"
    puts "id" + "\t" + "name" + "\t" + "email"
    records = 0
    Contact.all.each do |row|
      records += 1
      puts row[0] + "\t" + row[1] + "\t" + row[2]  
    end
    puts "------------------------"
    puts "#{records} records total"

  when "show"
    id = ARGV[1]
    puts "id" + "\t" + "name" + "\t" + "email" 
    puts Contact.find(id)!=nil ? Contact.find(id).join("\t") : "Contact with id not found"

  when "search"
    term = ARGV[1]
    records = 0
    puts "id" + "\t" + "name" + "\t" + "email"
    Contact.search(term).each do |row|
      records +=1
      puts row[0] + "\t" + row[1] + "\t" + row[2]
    end
    puts "------------------------"
    puts "#{records} records total"   

  else
    puts "No valid option entered"  

  end 

end

