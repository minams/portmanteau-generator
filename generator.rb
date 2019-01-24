def is_vowel? letter
  return ["a", "e", "i", "o", "u"].include?(letter)
end

def run_generator

  puts "What is the first word to combine?"

  a = gets.chomp

  while a.length < 2
    puts "Please enter a word greater than 1 character long"
    a = gets.chomp
  end

  a.downcase!

  puts "What is the second word to combine?"

  b = gets.chomp

  while b.length < 2
    puts "Please enter a word greater than 1 character long"
    b = gets.chomp
  end

  b.downcase!

  a_array = a.split("")

  a_vowel = ""

  a_array.each do | c |
    if is_vowel?(c)
      a_vowel = c
    end
  end


  b_array = b.split("")

  b_vowel = ""

  b_array.reverse.each do | c |
    if is_vowel?(c)
      b_vowel = c
    end
  end

  a_rev = a.reverse

  first = a_vowel.empty? ? a : a_rev.slice(a_rev.index(a_vowel) + 1, a_rev.length).reverse

  second = b_vowel.empty? ? b : b.slice(b.index(b_vowel), b.length)

  puts "#{ a } + #{ b } is #{ first + second }"
end

should_run = true

while (should_run)
  run_generator
  puts "continue?"
  should_run = gets.chomp == "yes"
end