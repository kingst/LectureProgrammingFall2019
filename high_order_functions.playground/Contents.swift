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

