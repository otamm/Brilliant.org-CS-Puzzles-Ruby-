# Let M be the least common multiple of all odd integers from 1 to 99, inclusive.
# What are the last 3 digits of M?

# solution begins on line 94, below are the methods (designed with future reuse in mind) used to solve the problem.



def is_prime?(n,prime_array=false) # number to be checked as first parameter, optional second parameter to be used with the 'prime_array' method.
  if n < 2
    return false
  elsif n == 2
    return true
  else
    if prime_array
      for i in (2..(n/2)+1) #it makes no sense to divide by numbers which would result in a result less than 2 (the smallest prime); the '+1' in the end is due to the default 'round down' in integer division in Ruby.
          prime_array.each { |prime| return false if (n % prime) == 0 }
      end
    else
      for i in (2..(n/2)+1)
        if (n % i) == 0
          return false
        end
      end
    end
  end
  return true
end

def prime_array(n) #returns an array with all primes less than number n.
  if n < 2
    return []
  elsif n == 2
    return [2]
  else
    prime_array = [2]
    for i in (3..n)
      prime_array.push(i) if is_prime?(i,prime_array) # the own prime_array built so far is passed as an argument in order to improve processing speed.
    end
  end
  return prime_array
end

def prime_factors(n,biggest_number_prime_array=false) #returns the prime factors of a given number. if n is prime, returns n. second parameter to improve speed if method would be utilized in a range of numbers.
  factors = []
  if biggest_number_prime_array
    primes = biggest_number_prime_array
  else
    primes = prime_array(n)
  end

  while true
    signal = factors.size #signalizes when to break the loop.
    primes.each do |prime|
      if (n % prime) == 0
        factors.push(prime)
        n = n / prime
        break
      end
    end
    if signal == factors.size
      factors.push(n)
      break
    end
  end
  factors = factors.sort
  return factors - [1] #...because 1 is not a prime.
end

def lcm(nums) #method that returns the least common multiple between a given array of numbers.
  nums = nums.uniq.sort
  primes = prime_array(nums[-1]) #biggest number in the whole array.
  factorized_nums = [] #holds the prime factors for each value in nums array.
  nums.each { |n| factorized_nums.push(prime_factors(n,primes)) }

  unique_lcm_factors = [] #individual prime factors of lcm
  lcm_factors = {} #prime factors of lcm
  for factors in factorized_nums
    for factor in factors.uniq
      if lcm_factors.include?(factor)
        lcm_factors[factor] = factors.count(factor) if factors.count(factor) > lcm_factors[factor]
      else
        lcm_factors[factor] = factors.count(factor)
      end
    end
  end

  lcm = 1
  lcm_factors.each { |factor,max_quantity| lcm *= factor ** max_quantity }
  return lcm
end

# solution below
odds = []
for i in (1..99)
  odds.push(i) if (i % 2) == 1
end

lcm(odds)

# => 1089380862964257455695840764614254743075
