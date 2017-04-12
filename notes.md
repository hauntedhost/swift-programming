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

## 16. Properties

- class, struct and enum can all have properties
- properties can be stored or computed

## 17. Initializers

### Structs

- by default structs get _empty_ initializer when defaults exist for all properties
- by default struct gets a _memberwise_ init for all properties on the type in order
- once you write a custom init, all memberwise initializers are removed

### Classes

- an initializer on a class is either a _designated_ or _convenience_ initializer
- classes get _empty_ initializer when defaults exist for all properties
- classes do _not_ get a _memberwise_ initializer like structs

## 18. Value vs Reference Types

- value types are copies (on write)
- swift's basic types are value types: Array, Dictionary, Int, String
- reference types retain pointers to same instance
- avoid using reference type properties in value types (e.g. structs)

## 19. Protocols

- defines an interface you want a type to satisfy
- a type that satisfies a protocol is said to confirm to it
- protocol can be _extended_ e.g. to add additional functions
- protocols can inherit, and even better can be _composed_

## 20. Error Handling

- recoverable errors can be handled
- _nonrecoverable_ errors are bugs that cause program to _trap_ (shutdown)
- functions marked `throws` indicates the function might emit an error
- calls to funcs/methods marked with `throws` must be prepared to handle that error
- handling errors can be done with do/try/catch
- handling errors in a function that is itself marked as `throws` can simply call `try` directly without do/catch
