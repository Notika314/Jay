puts 'enter your age'
age=gets.chomp.to_i
type= age<18 ? "child" : "old"
puts "Man, You are  #{type}"