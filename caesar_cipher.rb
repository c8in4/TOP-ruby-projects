ASCII_CODE_A = 65
ASCII_CODE_Z = 90

ASCII_CODE_a = 97
ASCII_CODE_z = 122

NUMBER_OF_LETTERS_IN_ALPHABET = 26

def caesar_cipher(str, shift)

  arr_of_ASCII = str.split("").map { |char|
    char =~ /[a-zA-Z]/ ? char.ord : char
  }
  
  arr_of_shifted_numbers = arr_of_ASCII.map { |element|
    if element.is_a?(Numeric)
      if element.between?(ASCII_CODE_A, ASCII_CODE_Z)
        shift_chars(element, shift, ASCII_CODE_A, ASCII_CODE_Z)
      elsif element.between?(ASCII_CODE_a, ASCII_CODE_z)
        shift_chars(element, shift, ASCII_CODE_a, ASCII_CODE_z)
      end
    else
      element
    end
  }

  arr_of_shifted_numbers.map { |element|
    element.is_a?(String) ? element : element.chr
  }.join("")
end

def shift_chars(num, shift, range_bottom, range_top)
  shifted_char = num + shift

  while shifted_char > range_top
    shifted_char -= NUMBER_OF_LETTERS_IN_ALPHABET
  end
  while shifted_char < range_bottom
    shifted_char += NUMBER_OF_LETTERS_IN_ALPHABET
  end
    
  shifted_char
end

puts "Enter a word or phrase:"
str = gets.chomp
puts "Enter a number:"
offset = gets.chomp.to_i

p str
p caesar_cipher(str, offset)

# p caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
