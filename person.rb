#this class stores information about people.
class Person
	attr_accessor :name, :age, :gender

#create the person object and store their name
  def initialize(name)
  @name= name
  end

#Print this person's name to the screen
  def print_name
  puts "Person called #{@name}" 
  end 
 end 	
 jack=Person.new("Jack")
 jack.age=21
 jack.gender="male"
 puts jack.name