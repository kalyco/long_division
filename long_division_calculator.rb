$DIVIDEND = rand(1000..9999)
$DIVISOR = rand(10..99)
$input = ""

$DIVIDEND_to_arr = $DIVIDEND.to_s.split('')
$DIVISOR_arr = $DIVISOR.to_s.split('')

def proceed(num)
  $input = gets.chomp
  until $input == "next"
    puts
    puts "please type 'next' to proceed. "
    $input = gets.chomp
  end
  if num != nil
    puts "STEP #{num}:\n\n"
    puts
  end
end

def closest_division(dividend, divisor)
  (dividend.to_f / divisor.to_f).to_i
end

def num_digits(num)
  Math.log10(num).to_i + 1
end

def valid?(solution)
  if solution = $DIVIDEND / $DIVISOR
    true
  end
end

def intro(binary)
  binary == 0 ? step = "6-step" : step = "4-step"
  puts "\n\n This is a #{step} long division tutorial. Type 'next' whenever you are ready to proceed.\n\n"
  proceed(nil)
  puts "\n\n random equation: #{$DIVIDEND} / #{$DIVISOR}\n\n"
  puts "STEP 1:\n\n"
end

def step_one(first_dividend, new_divisor, quotient_1)
    puts "Since #{$DIVISOR} is a 2-digit number, it will not go into #{$DIVIDEND_to_arr.first}, the first digit of #{$DIVIDEND}.
    So, successive digits are added until a number greater than #{$DIVISOR} is found.\n\n"
    puts "the closest we can get to #{first_dividend} without exceeding it is #{new_divisor},
which is #{quotient_1} x #{$DIVISOR}. So we will add that to our division:"
    puts "  _#{quotient_1}___ < first value in our quotient (final solution)"
    puts "#{$DIVISOR})#{$DIVIDEND}"
    puts "   #{new_divisor}"
    puts "type 'next' to move to step 2."
end

def step_two(new_divisor, first_dividend, first_sub, quotient_1, next_sub)
  puts "Next, we will work out the remainder by subtracting #{new_divisor} from #{first_dividend}.
That gives us #{first_sub}. Bring down the #{$DIVIDEND_to_arr[2]} to make a new target of #{next_sub}."
  puts "  _#{quotient_1}___"
  puts "#{$DIVISOR})#{$DIVIDEND}"
  puts "   #{new_divisor}"
  if num_digits(next_sub) == 2
    puts "  = #{next_sub} < see how the #{$DIVIDEND_to_arr[2]} from the main dividend drops down?"
  else
    puts "  = #{next_sub} < see how the #{$DIVIDEND_to_arr[2..3].join} from the main dividend drops down?"
  end
  puts "now for step 3."
end

def step_three(next_sub, sub_2, quotient_1, quotient_2, new_divisor)
  puts "With a target of #{next_sub} the closest we can get is #{sub_2} by multiplying #{$DIVISOR} by #{quotient_2}.
  We will write #{closest_division(next_sub,$DIVISOR)} in the next column of the answer,
and #{sub_2} below the #{next_sub} as shown:"
  puts "  _#{quotient_1}#{quotient_2}___"
  puts "#{$DIVISOR})#{$DIVIDEND}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "Pretty straightforward. Let's move on to step 4."
end

def step_four(sub_2, next_sub, remainder, remainder1, quotient_1, quotient_2, new_divisor)
  puts "Can you guess what we're going to do next?"
  puts "We are going to work out the remainder by subtracting #{sub_2} from #{next_sub}."
  puts "this gives us #{remainder}. Let's bring down the #{$DIVIDEND_to_arr[3]}
to make a new target of #{remainder1}, as #{$DIVISOR} can't go into #{remainder}."
  puts "  _#{quotient_1}#{quotient_2}___"
  puts "#{$DIVISOR})#{$DIVIDEND}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "    #{remainder1}"
  puts "Let's go to step 5."
end

def two_digit
  intro(0)
  first_dividend = ($DIVIDEND_to_arr[0..1].join).to_i
  quotient_1 = closest_division(first_dividend,$DIVISOR)
  new_divisor = $DIVISOR * quotient_1
  puts "In this case 1 digit is added to make #{first_dividend}."
  step_one(first_dividend, new_divisor, quotient_1)
  proceed(2)
  first_sub = (first_dividend - new_divisor).to_s
  next_sub = first_sub.split("") << $DIVIDEND_to_arr[2]
  (next_sub.join).to_i < $DIVISOR? next_sub << $DIVIDEND_to_arr[3] : nil
  next_sub = (next_sub.join).to_i
  step_two(new_divisor, first_dividend, first_sub, quotient_1, next_sub)
  proceed(3)
  sub_2 = $DIVISOR * closest_division(next_sub,$DIVISOR)
  quotient_2 = closest_division(next_sub,$DIVISOR)
  step_three(next_sub, sub_2, quotient_1, quotient_2, new_divisor)
  proceed(4)
  remainder = next_sub - sub_2
  remainder1 = [] << remainder
  remainder1 = (remainder1 << $DIVIDEND_to_arr[3].to_i).join
  step_four(sub_2, next_sub, remainder, remainder1, quotient_1, quotient_2, new_divisor)
  proceed(5)
  sub_3 = $DIVISOR * closest_division(remainder1,$DIVISOR)
  quotient_3 = closest_division(remainder1,$DIVISOR)
  puts "With a target of #{remainder1} the closest we can get is #{sub_3} by multiplying
  #{$DIVISOR} by #{quotient_3}. Write #{quotient_3} as the next quotient value,
  and #{sub_3} below the #{remainder1} as shown:"
  puts "  _#{quotient_1}#{quotient_2}#{quotient_3}__"
  puts "#{$DIVISOR})#{$DIVIDEND}"
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
  puts "So #{$DIVIDEND} / #{$DIVISOR} = #{final_quotient}, rem #{final_remainder}"
  puts "  _#{final_quotient}__"
  puts "#{$DIVISOR})#{$DIVIDEND}"
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
  intro(1)
  first_dividend = ($DIVIDEND_to_arr[0..2].join).to_i
  quotient_1 = closest_division(first_dividend,$DIVISOR)
  new_divisor = $DIVISOR * quotient_1
  puts "In this case 2 digits are added to make #{first_dividend}."
  step_one(first_dividend, new_divisor, quotient_1)
  proceed(2)
  first_sub = (first_dividend - new_divisor).to_s
  next_sub = first_sub.split("")
  next_sub << $DIVIDEND_to_arr[2]
  next_sub.join.to_i < $DIVISOR? next_sub << $DIVIDEND_to_arr[3] : nil
  next_sub = (next_sub.join).to_i
  step_two(new_divisor, first_dividend, first_sub, quotient_1, next_sub)
  proceed(3)
  sub_2 = $DIVISOR * closest_division(next_sub,$DIVISOR)
  quotient_2 = closest_division(next_sub,$DIVISOR)
  puts "With a target of #{next_sub} the closest we can get is #{sub_2} by multiplying #{$DIVISOR} by #{quotient_2}.
  We will write #{closest_division(next_sub,$DIVISOR)} in the next column of the answer,
and #{sub_2} below the #{next_sub} as shown:"
  puts "  _#{quotient_1}#{quotient_2}___"
  puts "#{$DIVISOR})#{$DIVIDEND}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "One last step!"
  proceed(4)
  remainder = [next_sub - sub_2]
  remainder = (remainder << $DIVIDEND_to_arr[3].to_i).join
  final_quotient = [quotient_1, quotient_2].join
  puts "Finally, we will subtract #{sub_2} from #{next_sub} giving #{remainder}.
  Since there are no other digits to bring down, #{remainder} is therefore the
  remainder for the whole sum."
  puts "So #{$DIVIDEND} / #{$DIVISOR} = #{final_quotient}, rem #{remainder}"
  puts
  puts "  _#{final_quotient}__"
  puts "#{$DIVISOR})#{$DIVIDEND}"
  puts "   #{new_divisor}"
  puts "   #{next_sub}"
  puts "   #{sub_2}"
  puts "    #{remainder}"
  puts valid?(final_quotient)
end

if $DIVISOR_arr[0].to_i < $DIVIDEND_to_arr[0].to_i
  two_digit
else
  three_digit
end
