import UIKit

let str0 = "abc"
let enc0: Data? = str0.data(using: .utf8)

let str1: String? = "def"
let enc1 = str1?.data(using: .utf8)

let foo = { (_ s: String) -> String in
    return "\(s).jpg"
}
foo("bob")

let bar = { $0 + ".jpg" }
bar("milo")

let fileName = str1.map { (_ name: String) -> String in
    return "dog_pictures/\(name)"
}

let fileName1 = str1.map { "dog_pictures/\($0)" } ?? "dog_pictures/milo.jpg"

let names: [String?] = ["bob.png", "annie.jpg", "milo.jpg", nil]
print(names)
//let paths: [Data?] = names.map { "dog_pictures/\($0)".data(using: .utf8) }
//print(paths)

let filteredPaths: [Data] = names.compactMap({ (name: String?) -> Data? in
    guard let name = name else {
        return nil
    }
    
    return name.data(using: .utf8)
    /*
    if !(name?.hasSuffix("jpg") ?? false) {
        return nil
    }
    
    return "jpg/\(name!)"*/
})

print(filteredPaths)

if let data = "asdfasdfasdf".data(using: .utf8) {
    let hex = data.map { String(format: "%02x", $0) }.reduce("") { $0 + $1 }
    print(hex)
}

let ints = [1, 2, 3, 4, 5]
let sum = ints.reduce(0) { $0 + $1 }
print(sum)

// redo lecture starts here
let mystr: String? = "Bob is the best"

let myfunction = { (str:String) -> String in
    return str + " dog ever"
}

print(myfunction("Milo is the best"))

let anotherString: String? = nil
print(anotherString.map(myfunction))

// goal is transform this
let transformedStr = mystr.map({ (str:String) -> String in
    return str + " dog ever"
})
print(transformedStr!)

let encoded = mystr.map({ (str:String) -> Data? in
    return str.data(using: .utf8)
})

let flatMapped = mystr.flatMap({ (str:String) -> Data in
    return str.data(using: .utf8)!
})

class MyArray {
    let array: [String]
    init(_ array: [String]) {
        self.array = array
    }
    
    func map<T>(transform: ((_ value: String) -> T)) -> [T] {
        var result: [T] = []
        for item in self.array {
            result.append(transform(item))
        }
        return result
    }
    
    func compactMap<T>(transform: ((_ value: String) -> T?)) -> [T] {
        var result: [T] = []
        for item: String in self.array {
            if let tItem = transform(item) {
                result.append(tItem)
            }
        }
        return result
    }
}

let dogNames = MyArray(["Bob", "Annie", "Milo"])
let dogFileNames = dogNames.map(transform: { (name: String) -> String in
    return name + ".jpg"
})
print(dogFileNames)

let quizScores = MyArray(["1", "50", "99"])
let intQuizScores = quizScores.map(transform: { (score: String) -> Int? in
    return Int(score)
})
print(intQuizScores)

let favDogs = dogNames.compactMap(transform: { (name: String) -> String? in
    if name == "Bob" {
        return name
    } else {
        return nil
    }
})

print(favDogs)
