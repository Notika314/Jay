
class String
  def titleize
    self.gsub(/(\A|\s)\w/){|letter| letter.upcase}
  end
end
raise "F1" unless "this is a test".titleize == "This Is A Test"
raise "F2" unless "another test 1234".titleize == "Another Test 1234"
raise "F3" unless "We're testing titleize".titleize =="We're Testing Titleize"
puts "why don't we all go to the beach this weekend?".titleize