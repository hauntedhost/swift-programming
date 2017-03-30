## Integers

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

## Doubles / Floats

- Double is 64 bit
- Float is 32 bit

## Tuples

- `(404, "Not found")`
- Access by index: `error.0`
- Named elements `(code: 404, message: "Not found")`
- Access by name: `error.code`

## Switch

- Not an expression wtf (╯°□°）╯︵ ┻━┻
- Comma separated cases, also ranges `case 200...299:`
- value binding `case let n:`
- `where` clauses `case let n where n > 5 && n < 10:`
- `fallthrough` for "control transfer" ಠ_ಠ
- Tuples matching with `_` wildcard `case (404, _):`

## If/Else

- classic: if statement { } else {}

```swift
let statusCode: Int = 404
if case 400...499 = statusCode {
  // do things
}
```

## For in

- classic: `for i in 1...10 {}`
- unbound: `for _ in 1...10 {}`
- where: `for i in 1...10 where i % 3 == 0 {}`

## Properties

- class, struct and enum can all have properties
- properties can be stored or computed
