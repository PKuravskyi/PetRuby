# frozen_string_literal: true

class CaesarCipher
  def caesar_cipher(str, shift)
    alphabet = ('a'..'z').to_a
    new_str = ''

    str.each_char do |char|
      if char.match(/[a-zA-Z]/)
        old_idx = alphabet.index(char.downcase)
        new_idx = (old_idx + shift) % 26
        new_char = alphabet[new_idx]
        new_str += char == char.upcase ? new_char.upcase : new_char.downcase
      else
        new_str += char
      end
    end

    new_str
  end
end
