enum TextAlignment {
  case left
  case right
  case center
  case justify
}

var alignment = TextAlignment.left
alignment = .center

print("alignment: \(alignment)")

switch alignment {
case .left:
  print("left aligned")
case .right:
  print("right aligned")
case .center:
  print("center aligned")
case .justify:
  print("justified")
}

// with default raw integer values
enum EnumNum: Int {
  case zero
  case one
  case two
  case three
}

let numNum = EnumNum.two
print("numNum.rawValue: \(numNum.rawValue)")

// with defined raw integer values
enum Numeral: Int {
  case I = 1
  case V = 5
  case X = 10
  case L = 50
  case C = 100
  case D = 500
  case M = 1_000
}
let numeral = Numeral.D
print("numeral: \(numeral)")
print("numeral.rawValue: \(numeral.rawValue)")

// with raw string values and defaults
enum Language: String {
  case cpp = "c++"
  case objectiveC = "objective-c"
  case swift
  case haskell
  case elixir
  case erlang
  case javascript
  case ruby
}
let favoriteLang = Language.elixir
print("my favorite language is \(favoriteLang.rawValue)")

// enum methods
enum LightBulb {
  case on
  case off

  func isHot() -> Bool {
    return self == .on
  }

  mutating func toggle() {
    switch self {
    case .on:
      self = .off
    case .off:
      self = .on
    }
  }
}
var bulb = LightBulb.on
print("bulb.isHot: \(bulb.isHot())")
bulb.toggle()
print("bulb.isHot: \(bulb.isHot())")

// associated enum values
enum Shape {
  case point
  case square(side: Double)
  case rectangle(width: Double, height: Double)

  func area() -> Double {
    switch self {
    case .point:
      return 0
    case let .square(side: side):
      return side * side
    case let .rectangle(width: width, height: height):
      return width * height
    }
  }
}
var point = Shape.point
var square = Shape.square(side: 5)
var rectangle = Shape.rectangle(width: 5, height: 10)
print("point.area: \(point.area())")
print("square.area: \(square.area())")
print("rectangle.area: \(rectangle.area())")

// recursive enum
enum FamilyTree {
  case unknown
  indirect case father(fatherName: String, fatherAncestors: FamilyTree)
  indirect case mother(motherName: String, motherAncestors: FamilyTree)
  indirect case both(
    fatherName: String,
    fatherAncestors: FamilyTree,
    motherName: String,
    motherAncestors: FamilyTree
  )
}

let family = FamilyTree.both(
  fatherName: "Kevin",
  fatherAncestors: FamilyTree.both(
    fatherName: "Frank",
    fatherAncestors: FamilyTree.unknown,
    motherName: "Mary",
    motherAncestors: FamilyTree.unknown
  ),
  motherName: "Ellen",
  motherAncestors: FamilyTree.both(
    fatherName: "Don",
    fatherAncestors: FamilyTree.unknown,
    motherName: "Marian",
    motherAncestors: FamilyTree.mother(
      motherName: "Eva",
      motherAncestors: FamilyTree.unknown
    )
  )
)

// recursive enum
enum BinaryTree {
  case none(value: Int)
  indirect case left(value: Int, left: BinaryTree)
  indirect case right(value: Int, right: BinaryTree)
  indirect case both(
    value: Int,
    left: BinaryTree,
    right: BinaryTree
  )
}

//          5
//         / \
//        10  30
//       / \
//     13   22
let tree = BinaryTree.both(
  value: 5,
  left: .both(
    value: 10,
    left: .none(value: 13),
    right: .none(value: 22)
  ),
  right: BinaryTree.none(value: 30)
)
print(tree)
