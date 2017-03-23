## Integers

- Int is 64 bit
- Int.max and Int.min
- Also Int64, Int32, Int8
- UInt are "unsigned", i.e. have no negative numbers. UInt.min is 0
- Prefer Int, even for quantities that can never be negative (otherwise you must convert)
-
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
