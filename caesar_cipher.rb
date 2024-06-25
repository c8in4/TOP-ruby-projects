ASCII_CODE_UPCASE_A = 65
ASCII_CODE_UPCASE_Z = 90

ASCII_CODE_DOWNCASE_a = 97
ASCII_CODE_DOWNCASE_z = 122

NUMBER_OF_LETTERS_IN_ALPHABET = 26

def caesar_cipher(str, shift)

  arr_of_numbers = str.split("").map { |char| char.ord }    # TODO: only convert if char in range of a-z and A-Z ?
  
  arr_of_shifted_numbers = arr_of_numbers.map { |num|
    if num >= ASCII_CODE_UPCASE_A && num <= ASCII_CODE_UPCASE_Z
      shift_chars(num, shift, ASCII_CODE_UPCASE_A, ASCII_CODE_UPCASE_Z)
    elsif num >= ASCII_CODE_DOWNCASE_a && num <= ASCII_CODE_DOWNCASE_z
      shift_chars(num, shift, ASCII_CODE_DOWNCASE_a, ASCII_CODE_DOWNCASE_z)
    else
      num
    end
  }

  arr_of_shifted_numbers.map { |num| num.chr }.join("")     # TODO: only convert if num is of type int in range of 60 ?
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

p "AaBbCc XxYyZz"
p caesar_cipher("AaBbCc XxYyZz", offset)

# p caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
