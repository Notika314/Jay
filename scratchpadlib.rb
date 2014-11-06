class Temperature
 def initialize(options={})
   @options=options
 end
    
    
    def in_celsius(options={})
    if @options[:f] 
      result=5*(@options[:f]-32)/9
    else
      @options[:c]
    end
  end
  
  def in_fahrenheit(options={})
    if @options[:c]
      result=32+(9*@options[:c].to_f/5)
      if result==result.to_i.to_f
        result=result.to_i
      else
        result
      end
    else
      @options[:f]
    end
  end
end
temp=Temperature.new({:c=>41})
puts temp.in_fahrenheit
