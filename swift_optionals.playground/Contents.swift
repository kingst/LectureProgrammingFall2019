import UIKit

let aName: String? = "Bob"
let bName: String? = Optional.some("Milo")
var cName: String? = Optional.none

if let theName = aName {
    print("My current dog is \(theName)")
}

func foo(_ name: String?, anotherName: String?) {
    guard let theName = name, let _ = anotherName else {
        print("Couldn't find my dog's name")
        return
    }
    
    print(theName)
}

foo(aName, anotherName: "Annie")
foo(cName, anotherName: nil)

func foo2(bar: String?) {
    let biz = bar?.hasPrefix("d")
    // what is the type of the variable biz
    
    let baz = bar ?? "bob"
    // what is the type of the variable baz
}

func getOrElse<T>(_ value: T?, defaultValue: T) -> T {
    if value != nil {
        return value!
    } else {
        return defaultValue
    }
}

let baz = getOrElse(aName, defaultValue: "Milo")
let biz = getOrElse(cName, defaultValue: "Annie")

let a: Any = Int(42)
let b: Int? = a as? Int

func openFile() {
    guard let documentDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) else {
        print("Could not open the document directory")
        return
    }
    
    print("The document directory is \(documentDirectory.absoluteString)")
}

openFile()

