module Enumerable

    def my_each
        i=0
          while i < length
          yield self[i]
          i += 1
        end
    end

a = ['Raj','Manish']
a.my_each { |friend| puts friend }
end