## Chapters 1-15

### Integers

- Int is 64 bit
- Int.max and Int.min
- Also Int64, Int32, Int8
- UInt are "unsigned", i.e. have no negative numbers. UInt.min is 0
- Prefer Int, even for quantities that can never be negative (otherwise you must convert)
- % operator is _remainder_ not modulus

```swift
// here's a modulus operator
infix operator %%
func %%(_ num: Int, _ mod: Int) -> Int {
  let remain = num % mod
  return remain >= 0 ? remain : remain + mod
}
```

### Doubles / Floats

- Double is 64 bit
- Float is 32 bit

### Tuples

- `(404, "Not found")`
- Access by index: `error.0`
- Named elements `(code: 404, message: "Not found")`
- Access by name: `error.code`

### Switch

- Not an expression wtf (╯°□°）╯︵ ┻━┻
- Comma separated cases, also ranges `case 200...299:`
- value binding `case let n:`
- `where` clauses `case let n where n > 5 && n < 10:`
- `fallthrough` for "control transfer" ಠ_ಠ
- Tuples matching with `_` wildcard `case (404, _):`

### If/Else

- classic: if statement { } else {}

```swift
let statusCode: Int = 404
if case 400...499 = statusCode {
  // do things
}
```

### For in

- classic: `for i in 1...10 {}`
- unbound: `for _ in 1...10 {}`
- where: `for i in 1...10 where i % 3 == 0 {}`

## Chapter 16. Properties

- class, struct and enum can all have properties
- properties can be stored or computed

## Chapter 17. Initializers

### Structs

- by default structs get _empty_ initializer when defaults exist for all properties
- by default struct gets a _memberwise_ init for all properties on the type in order
- once you write a custom init, all memberwise initializers are removed

### Classes

- an initializer on a class is either a _designated_ or _convenience_ initializer
- classes get _empty_ initializer when defaults exist for all properties
- classes do _not_ get a _memberwise_ initializer like structs

## Chapter 18. Value vs Reference Types

- value types are copies (on write)
- swift's basic types are value types: Array, Dictionary, Int, String
- reference types retain pointers to same instance
- avoid using reference type properties in value types (e.g. structs)

## Chapter 19. Protocols

- defines an interface you want a type to satisfy
- a type that satisfies a protocol is said to confirm to it
- protocol can be _extended_ e.g. to add additional functions
- protocols can inherit, and even better can be _composed_

## Chapter 20. Error Handling

- recoverable errors can be handled
- _nonrecoverable_ errors are bugs that cause program to _trap_ (shutdown)
- functions marked `throws` indicates the function might emit an error
- calls to funcs/methods marked with `throws` must be prepared to handle that error
- handling errors can be done with do/try/catch
- handling errors in a function that is itself marked as `throws` can simply call `try` directly without do/catch

## Chapter 21. Extensions

- typealias allows definition of _synonyms_ for existing types
- extensions on typealias are available on original type
- types/classes can be extended to conform to protocols
- oooh extensions can add an initializer w/out losing memberwise initializers

## Chapter 22. Generics

- placeholder types, e.g. `<Element>` are used in type/func declarations
- the placeholder type can then be used inside the structure/func itself
- type constraints place restrictions on types that can be passed to generic functions and methods
- two types of type constraints:
  1. constraint that a type be a subclass of a given class
  2. constraint that type conform to a protocol (or protocol composition)
- protocols cannot be generic but they can have _associated types_
- reach for protocols and generics before class inheritance, i.e. generics and compile-time polymorphism (parametric polymorphism) ftw

## Chapter 23. Protocol Extensions

### Protocol naming conventions:
- "is a" protocols are *nouns* that often have suffix `Type` e.g. `Collection`, `Sequence`, `IntegerType`, `CollectionType`
- "can do/be" protocols that describe capabilities end with suffixes `able`, `ible` or `ing` e.g. `Equatable`, or `Hashable`

- note: be careful when writing protocol extensions that add properties or methods that are not default implementions for _requirements_ of the protocol

## Chapter 24. Memory Management and ARC

- you don't have to worry about memory management of value types
- by default all references that you create are _strong_ references which means they increment the reference count of the instance they refer to
- strong reference cycles is the term for when two instances have strong references to each other and are a kind of _memory leak_
- weak references do not increase reference count and are deallocated when references to instance they point to are set to nil
- weak references must always be var and always be optionals
- Person is a class that owns assets, so it makes sense that it would keep strong references to the assets. Asset is a class that is owned by Person. if it wants a reference to its owner it should be weak.
- by default captures in closures are made by taking _strong_ references
