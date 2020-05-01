module Enumerable

    def my_each
        i=0
        if block_given?
          while i < length
          yield self[i]
          i += 1
          end
        end
    end

    def my_each_with_index
        i = 0
        while i < length
            yield self[i], i
            i+=1
        end
    end

a = ["Raj", "Manish", "Pratima", "Pooja"]
a.my_each { |friend| puts friend }
a.my_each_with_index { |friend, index| puts friend if index.odd?}
end