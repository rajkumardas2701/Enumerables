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

    def my_all?(value = nil, &block)
        if block_given?
            my_each { |x| return false if block.call(x) == false}
        elsif value.is_a?(Class)
            my_each { |x| return false if x.is_a?(value) == false }        
        elsif value.is_a?(Regexp)
            my_each { |x| return false if value.match?(x.to_s) == false }
        elsif value.nil? == false
            my_each { |x| return false if x != value}
        else
            my_each {|x| return false unless x}
        end
        return true
    end

    def my_any?(value = nil, &block)
        if block_given?
            my_each { |x| return true if block.call(x)}
        elsif value.is_a?(Class)
            my_each { |x| return true if x.is_a?(value)}        
        elsif value.is_a?(Regexp)
            my_each { |x| return true if value.match?(x.to_s)}
        elsif value.nil? == false
            my_each { |x| return true if x.eq(value)}
        else
            my_each {|x| return true if x}
        end
        return false
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
puts "=========================="
puts "my_all? example:"
b = [4, 5.0]
puts a.my_all? {|word| word.length <= 1}
puts b.my_all?(Numeric)
puts a.my_all?(/t/)
puts "=========================="
puts "my_any? example:"
b = [4, 5.0]
puts a.my_any? {|word| word.length <= 1}

end