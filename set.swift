// three ways to declare and initialize a set
var set1: Set<String> = []
var set2 = Set<String>()
var set3 = Set([1, 2, 3])

// create set and insert additional items
var myFruits: Set<String> = ["orange", "mango"]
myFruits.insert("apple")
myFruits.insert("pineapple")
myFruits.insert("pineapple")
myFruits.insert("pineapple")
print("myFruits: \(myFruits)")

// loops
print("---")
for fruit in myFruits {
  print("fruit: \(fruit)")
}

// contains, union, intersection
let otherFruits = Set(["apple", "orange", "pear", "blueberry", "banana"])
print("---")
print("myFruits: \(myFruits)")
print("otherFruits: \(otherFruits)")
print("my fruits include banana? \(myFruits.contains("banana"))")
print("other fruits include banana? \(otherFruits.contains("banana"))")
print("union: \(myFruits.union(otherFruits))")
print("intersection: \(myFruits.intersection(otherFruits))")

// isSubset
let unitedStates = Set([
  "Alabama",
  "Alaska",
  "American Samoa",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "District Of Columbia",
  "Federated States Of Micronesia",
  "Florida",
  "Georgia",
  "Guam",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Marshall Islands",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Northern Mariana Islands",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Palau",
  "Pennsylvania",
  "Puerto Rico",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virgin Islands",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming",
])

let myStates = Set([
  "California",
  "Mississippi",
  "New York",
  "North Carolina",
  "Oregon",
  "Pennsylvania",
])

print("all my states are in u.s.? \(myStates.isSubset(of: unitedStates))")
