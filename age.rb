puts 'enter your age'
age=gets.chomp.to_i
type= age<18 ? "child" : "adult"
puts "you are such a #{type}"