# require 'byebug'

module Enumerable
# rubocop:disable Style/CaseEquality
    def my_each
        i = 0
        if block_given?
          while i < length
          yield self[i]
          i += 1
          end
          return self
        end
            to_enum
    end

    def my_each_with_index
        i = 0
        if block_given?
            while i < length
                yield self[i], i
                i += 1
            end
        end
            to_enum
    end

    def my_select
        
        a = []
        return to_enum unless block_given?
        
        my_each {|x| a.push(x) if yield(x)}
        puts a
    end


        
a = ["Raj", "Manish", "Pratima", "Pooja"]
puts "my_each example:"
a.my_each { |friend| puts friend }
puts "=========================="
puts "my_each_with_index example:"
a.my_each_with_index { |friend, index| puts friend if index.even?}
puts "=========================="
puts "my_select example:"
a.my_select {|x| x != "Raj"}
end