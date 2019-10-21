import UIKit

let names = ["Bob", "Annie", "Milo", "Chewy"]
let _ = names.sorted(by: >)

func backwards(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

// you can use named functions as arguments
print(names.sorted(by: backwards))


// you can also us lambda, or unnamed functions (long form)
print(names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
}))

// inteferring types from context
print(names.sorted(by: { s1, s2 in return s1 > s2 }))

// implicit return from single-expression closures
print(names.sorted(by: { s1, s2 in s1 > s2 }))

// shorthand arguments
print(names.sorted(by: { $0 > $1 }))

// inferring arguments
print(names.sorted { $0 > $1 })

// WARNING WARNING WARNING
// closures can execute later!
DispatchQueue.main.async {
    print("first line")
}
print("second line")

// capturing values (don't do this, but do understand what it does)
func makeIncrementor(incrementBy amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(incrementBy: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

let incrementBySix = makeIncrementor(incrementBy: 6)
print(incrementBySix())
print(incrementByTen())

