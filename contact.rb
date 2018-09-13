class Contact

  @@contacts_list = []
  @@nextid = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@nextid
    @@nextid += 1
  end
  # readers
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  def nextid
    @@nextid
  end

  # Writers
  def first_name=()
    @first_name = first_name
  end

  def last_name=()
    @last_name = last_name
  end

  def email=()
    @email = email
  end

  def note=()
    @note = note
  end

  def id=()
    @id = id
  end

  def contacts_list=()
    @@contacts_list = contacts_list
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first, last_name, email, note)
    new_contact = Contact.new(first, last_name, email, note)
    @@contacts_list << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts_list
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts_list.each do |contact|
      if id == contact.id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute,value)
      if attribute == "first_name"
        @first_name = value
      elsif attribute == "last_name"
        @last_name = value
      elsif attribute == "email"
        @email = value
      else attribute == "note"
        @note = value
      end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute)
    @@contacts_list.each do |contact|
      if contact.full_name.include?(attribute) || contact.email.include?(attribute)
        return contact
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts_list = []
  end

  def full_name
    return "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete(id)
    @@contacts_list.delete_if do |contact|
      if id == contact.id
        true
      end
    end
  end
# Feel free to add other methods here, if you need them.
end

contact1 = Contact.create("nick", "delfo", "nick@hotmail.com", "nothing for now")
Contact.create("dan", "meyer", "dan@gmail.com", "need to be contacted")
Contact.create("chris", "ford", "chris@telus.com", "N/A")
#puts Contact.all.inspect
#puts Contact.find(2).inspect
# puts Contact.find_by("ford").inspect
# Contact.delete(2)
# puts Contact.all.inspect
contact1.update("first_name","john")
puts Contact.all.inspect
