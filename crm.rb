require_relative 'contact'
class CRM

  def initialize(name)
    puts "This CRM has the name " + name
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1
      self.add_new_contact
    when 2
      self.modify_existing_contact
    when 3
      self.delete_contact
    when 4
      self.display_all_contacts
    when 5
      self.search_by_attribute
    when 6
      exit!
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp
    print 'Enter Last Name: '
    last_name = gets.chomp
    print 'Enter Email Address: '
    email = gets.chomp
    print 'Enter a Note: '
    note = gets.chomp
    contact = Contact.create(first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )
  end

  def modify_existing_contact
    puts "What is the id of the contact you want to edit ?"
    id = gets.chomp.to_i
    p contact = Contact.find(id)
    puts "what do you wants to change ?"
    attribute = gets.chomp.to_s
    puts "What is the new value ?"
    value = gets.chomp.to_s
    contact.update(attribute,value)
  end

  def delete_contact
    puts "What is the id of the contact you want to delete ?"
    id = gets.chomp.to_i
    Contact.delete(id)
  end

  def display_all_contacts
    puts Contact.all.inspect
  end

  def search_by_attribute
    puts "Who are your looking for ?"
    attribute = gets.chomp.to_s
    Contact.find_by(attribute)
  end


end

at_exit do
  ActiveRecord::Base.connection.close
end
a_crm_app = CRM.new ("My CRM")
a_crm_app.main_menu
# puts Contact.all.inspect
# Contact.delete(2)
# puts Contact.all.inspect
