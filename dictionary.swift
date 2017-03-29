
// four ways to declare and initialize a dictionary
var dict1: Dictionary<String, Int> = [:]
var dict2 = Dictionary<String, Int>()
var dict3: [String:Int] = [:]
var dict4 = [String:Int]()

// create a dictionary of movie ratings
var movieRatings = [
  "The Handmaiden": 94,
  "Julieta": 82,
  "Moonlight": 97,
]
print("I have \(movieRatings.count) movies")
print("movieRatings: \(movieRatings)")

// dictionary values are optionals
print("---")
let moonlightRating = movieRatings["Moonlight"]
print("moonlightRating type: \(type(of: moonlightRating))")
print("moonlightRating: \(moonlightRating!)")

// directly add/update key value
print("---")
movieRatings["Cameradict"] = 99
print("movieRatings: \(movieRatings)")

// update with updateValue method
// updateValue (maybe) mutates dictionary and returns (optional) value _before_ update
print("---")
let oldRating = movieRatings.updateValue(83, forKey: "Julieta")
print("oldRating type: \(type(of: oldRating))")
if let oldRating = oldRating, let currentRating = movieRatings["Julieta"] {
  print("oldRating = \(oldRating), currentRating = \(currentRating)")
}
print("movieRatings: \(movieRatings)")

// setting a key's value to nil when value type is not optional _removes_ it
// from the dictionary, wow
print("---")
movieRatings["Despite The Falling Snow"] = 13
print(movieRatings)
movieRatings["Despite The Falling Snow"] = nil
print(movieRatings)
// direct update and removeValue method are nil key safe
movieRatings["Despite The Falling Snow"] = nil
movieRatings.removeValue(forKey: "Despite The Falling Snow")

// looping
print("---")
for (movie, rating) in movieRatings {
  print("\(movie) is rated \(rating)")
}

for movie in movieRatings.keys {
  print("movie: \(movie)")
}

// sending keys to an array
print("---")
let movies = Array(movieRatings.keys)
let ratings = Array(movieRatings.values)
print(movies)
print(ratings)
