require 'byebug'
def prime?(num)
  (2..num-1).each do |i|
    if (num % i) == 0
      return false
    end
  end
  
  true
end

def primes(num_primes)
  ps = []
  num = 1
  while ps.count < num_primes
    ps << num if prime?(num)
    num=num+1
  end
  ps
end


  if __FILE__ == $PROGRAM_NAME
    puts primes(100)
  end