
$dividend = rand(1000..9999)
$divisor = rand(10..99)
$input = ""

$dividend_to_arr = $dividend.to_s.split('')
$divisor_arr = $divisor.to_s.split('')

def proceed(num)
  $input = gets.chomp
  until $input == "next"
    puts
    puts "please type 'next' to proceed. "
    $input = gets.chomp
  end
  if num != nil
    puts "STEP #{num}:"
    puts
  end
end

def closest_division(dividend, divisor)
  (dividend.to_f / divisor.to_f).to_i
end

def num_digits(num)
  Math.log10(num).to_i + 1
end

def proceed_2
  puts
  puts "You'll notice that the division is set very carefully with the digits in
the vertical columns. This is very important when you work them out by hand."
  puts "let's go on to step 2"
end

def valid?(solution)
  if solution = $dividend / $divisor
    true
  end
end

def two_digit
  first_dividend = ($dividend_to_arr[0..1].join).to_i
  quotient_1 = closest_division(first_dividend,$divisor)
  new_divisor = $divisor * quotient_1
  puts "In this case 1 digit is added to make #{first_dividend}."
  puts "the closest we can get to #{first_dividend} without exceeding it is
  #{new_divisor}, which is #{quotient_1} x #{$divisor}. So we will add that to our division:"
  puts "  _#{quotient_1}___ < first value in our quotient (final solution)"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  proceed_2
  proceed(2)
  first_sub = (first_dividend - new_divisor).to_s
  next_sub = first_sub.split("")
  next_sub << $dividend_to_arr[2]
  next_sub.join.to_i < $divisor? next_sub << $dividend_to_arr[3] : nil
  next_sub = (next_sub.join).to_i
  puts "Next, we will work out the remainder by subtracting #{new_divisor} from #{first_dividend}.
  That gives us #{first_sub}. Bring down the #{$dividend_to_arr[2]} to make a new target of #{next_sub}."
  puts "  _#{quotient_1}___"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  if num_digits(next_sub) == 2
    puts "  = #{next_sub} < see how the #{$dividend_to_arr[2]} from the main dividend drops down?"
  else
    puts "  = #{next_sub} < see how the #{$dividend_to_arr[2..3].join} from the main dividend drops down?"
  end
  puts "ready for step 3?"
  proceed(3)
  sub_2 = $divisor * closest_division(next_sub,$divisor)
  quotient_2 = closest_division(next_sub,$divisor)
  puts "With a target of #{next_sub} the closest we can get is #{sub_2} by multiplying #{$divisor} by #{quotient_2}.
  We will write #{closest_division(next_sub,$divisor)} in the next column of the answer,
and #{sub_2} below the #{next_sub} as shown:"
  puts "  _#{quotient_1}#{quotient_2}___"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "Pretty straightforward. Let's move on to step 4."
  proceed(4)
  remainder = next_sub - sub_2
  remainder1 = [] << remainder
  remainder1 = (remainder1 << $dividend_to_arr[3].to_i).join
  puts "Can you guess what we're going to do next?"
  puts "We are going to work out the remainder by subtracting #{sub_2} from #{next_sub}."
  puts "this gives us #{remainder}. Let's bring down the #{$dividend_to_arr[3]}
to make a new target of #{remainder1}, as #{$divisor} can't go into #{remainder}."
  puts "  _#{quotient_1}#{quotient_2}___"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "    #{remainder1}"
  puts "Let's go to step 5."
  proceed(5)
  sub_3 = $divisor * closest_division(remainder1,$divisor)
  quotient_3 = closest_division(remainder1,$divisor)
  puts "With a target of #{remainder1} the closest we can get is #{sub_3} by multiplying
  #{$divisor} by #{quotient_3}. Write #{quotient_3} as the next quotient value,
  and #{sub_3} below the #{remainder1} as shown:"
  puts "  _#{quotient_1}#{quotient_2}#{quotient_3}__"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "    #{remainder1}"
  puts "    #{sub_3} "
  puts "Last step!"
  proceed(6)
  final_remainder = remainder1.to_i - sub_3
  final_quotient = [quotient_1, quotient_2, quotient_3].join
  puts "Finally, subtract #{sub_3} from #{remainder1}, to give #{final_remainder}."
  puts "Since there are no other digits to bring down, #{final_remainder} is also the
  remainder for the whole sum."
  puts
  puts "So #{$dividend} / #{$divisor} = #{final_quotient}, rem #{final_remainder}"
  puts "  _#{final_quotient}__"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "    #{remainder1}"
  puts "    #{sub_3} "
  puts "     #{final_remainder}"
  puts " not too hard, huh?"
  puts valid?(final_quotient)
end

def three_digit
  first_dividend = ($dividend_to_arr[0..2].join).to_i
  quotient_1 = closest_division(first_dividend,$divisor)
  new_divisor = $divisor * quotient_1
  puts "In this case 2 digits are added to make #{first_dividend}."
  puts "the closest we can get to #{first_dividend} without exceeding it is
  #{new_divisor}, which is #{quotient_1} x #{$divisor}. So we will add that to our division:"
  puts "  _#{quotient_1}___ < first value in our quotient (final solution)"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  proceed_2
  proceed(2)
  first_sub = (first_dividend - new_divisor).to_s
  next_sub = first_sub.split("")
  next_sub << $dividend_to_arr[2]
  next_sub.join.to_i < $divisor? next_sub << $dividend_to_arr[3] : nil
  next_sub = (next_sub.join).to_i
  puts "Next, we will work out the remainder by subtracting #{new_divisor} from #{first_dividend}.
  That gives us #{first_sub}. Bring down the #{$dividend_to_arr[2]} to make a new target of #{next_sub}."
  puts "  _#{quotient_1}___"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  if num_digits(next_sub) == 3
    puts "  = #{next_sub} < see how the #{$dividend_to_arr[2]} from the main dividend drops down?"
  else
    puts "  = #{next_sub} < see how the #{$dividend_to_arr[2..3].join} from the main dividend drops down?"
  end
  puts "ready for step 3?"
  proceed(3)
  sub_2 = $divisor * closest_division(next_sub,$divisor)
  quotient_2 = closest_division(next_sub,$divisor)
  puts "With a target of #{next_sub} the closest we can get is #{sub_2} by multiplying #{$divisor} by #{quotient_2}.
  We will write #{closest_division(next_sub,$divisor)} in the next column of the answer,
and #{sub_2} below the #{next_sub} as shown:"
  puts "  _#{quotient_1}#{quotient_2}___"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "One last step!"
  proceed(4)
  remainder = [next_sub - sub_2]
  remainder = (remainder << $dividend_to_arr[3].to_i).join
  final_quotient = [quotient_1, quotient_2].join
  puts "Finally, we will subtract #{sub_2} from #{next_sub} giving #{remainder}.
  Since there are no other digits to bring down, #{remainder} is therefore the
  remainder for the whole sum."
  puts "So #{$dividend} / #{$divisor} = #{final_quotient}, rem #{remainder}"
  puts
  puts "  _#{final_quotient}__"
  puts "#{$divisor})#{$dividend}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "    #{remainder}"
  puts valid?(final_quotient)
end

puts "This is a (4-6)-step long division tutorial. Type 'n' whenever you are ready to proceed."
puts
puts "Randomly generated equation: #{$dividend} / #{$divisor}"
puts "STEP 1:"
puts "Since #{$divisor} is a 2-digit number, it will not go into #{$dividend_to_arr.first}, the first digit of #{$dividend}.
So, successive digits are added until a number greater than #{$divisor} is found."
if $divisor_arr[0].to_i < $dividend_to_arr[0].to_i
  two_digit
else
  three_digit
end
