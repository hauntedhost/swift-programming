func fizzBuzz(_ count: Int) {
  for n in 1...count {
    switch (n % 3, n % 5) {
    case (0, 0):
      print("FizzBuzz")
    case (0, _):
      print("Fizz")
    case (_, 0):
      print("Buzz")
    default:
      print(n)
    }
  }
}

fizzBuzz(100)
