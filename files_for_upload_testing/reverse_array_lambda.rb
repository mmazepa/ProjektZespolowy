def reverse_array(*b)
    if b.size == 1
        return b
    else
        return reverse_array(*b[1..-1])+[b[0]]
    end
end

print reverse_array("!\n","ld","wor",", ","llo","He")

def greet(greeted="world",greeting="Hello")
    greeting + ", " + greeted + "!\n"
end

print greet("people")

add2 = lambda {|x| x+2}  # podstawowy zapis lambdy
add2 = ->(x) { x+2 }     # równoważny zapis przy użyciu "dash-rocket", działa w Ruby od wersji 1.9

add2.call(10)            #=> 12

def addX(x)
    lambda {|y| y+x}
end