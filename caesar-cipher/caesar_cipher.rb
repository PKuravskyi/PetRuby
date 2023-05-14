# frozen_string_literal: true

class CaesarCipher
  def caesar_cipher(str, shift)
    alphabet = ('a'..'z').to_a # create an array of all lowercase letters
    new_str = '' # create an empty string to store the encrypted message

    str.each_char do |char|
      if char.match(/[a-zA-Z]/)
        old_idx = alphabet.index(char.downcase) # find the index of the current character in the alphabet
        new_idx = (old_idx + shift) % 26 # shift the index by the given amount (wrapping around if necessary)
        new_char = alphabet[new_idx] # find the new character corresponding to the new index
        new_str += char == char.upcase ? new_char.upcase : new_char.downcase # preserve the case of the original character
      else
        new_str += char
      end
    end

    new_str
  end
end
