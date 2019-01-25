def get_input( message )
  puts message
  input = gets.chomp

  while input.length < 2
    puts "Please enter a word greater than 1 character long"
    input = gets.chomp
  end

  input.downcase!

  return input
end

def is_vowel?( letter )
  return ["a", "e", "i", "o", "u"].include?(letter)
end

def find_vowel( word )
  vowel = ""

  letter_array = word.split("")

  letter_array.each do |letter|
    if is_vowel?(letter)
      vowel = letter
    end
  end

  return vowel
end

def run_generator

  input_a = get_input("What is the first word to combine?")

  input_b = get_input("What is the second word to combine?")

  input_a_vowel = find_vowel( input_a )

  input_b_vowel = find_vowel( input_b.reverse )

  a_rev = input_a.reverse

  prefix = input_a_vowel.empty? ? input_a : a_rev.slice(a_rev.index(input_a_vowel) + 1, a_rev.length).reverse

  suffix = input_b_vowel.empty? ? input_b : input_b.slice(input_b.index(input_b_vowel), input_b.length)

  puts "#{ input_a } + #{ input_b } is #{ prefix + suffix }"
end

should_run = true

while (should_run)
  run_generator
  puts "continue?"
  should_run = gets.chomp == "yes"
end