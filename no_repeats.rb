#!/usr/bin/env ruby
def no_repeats
  puts "enter first year"
  first_year=gets.chomp
  puts "thanks. now put last year"
  last_year=gets.chomp
  no_repeats=[]
  (first_year..last_year).each do |year|
    if year.to_s.split("")==year.to_s.split("").uniq
      no_repeats<<year
    end
  end
  print "here are all the years with no repeats: #{ no_repeats}"
end
puts no_repeats