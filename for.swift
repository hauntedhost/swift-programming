for i in 1...10 {
  print(i)
}

print("---")

for i in 1...100 where i % 3 == 0 {
  print(i)
}
