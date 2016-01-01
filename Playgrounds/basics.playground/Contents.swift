//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var str2 = "2nd String QB"
let pi: Float = 3.14
var whatsPi = "Pi is \(pi) dummy"

var myFirstArray = ["Jay", "Jonah", "Jamison", 89]
var myFirstDict = [String: Int]()
let mySecondDict = [
    1: "Blah Blah",
    2.4: "Blue Blue",
    5.5: "Red Red"
]

print(mySecondDict[5.5])
for x in mySecondDict.keys {
    print(x)
}


var optionalStr: String? = nil
var greeting = "Hello!"


// Ternary Coalescent Operator
let defaultVal = "Munge"
var someVal: String? = nil
var defaultIfNotNil = someVal ?? defaultVal  // Note: the result is not optional here




// Try to assign the constant variable name the value of optionalStr
// If there's no value then name doesn't exist?
if let name = optionalStr {
    // Name only exists within this scope
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, Stranger!"
//     print(name)  -- INTERESTING! It doesn't indeed
}


// ---- Switches
var vegetable: String = "Red Pepper"

switch vegetable.lowercaseString {
    case "celery":
        print("Gross....celery")
    case "cucumber, watercress":
        print("Veggies of the Gods")
    case let x where x.hasSuffix("pepper"):
        print("What wizardry is this? \(x)")
    default:
        print("Yum")
}

// --- Dictionaries
let interestingNUmbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
for (key, value) in interestingNUmbers {
    for number in value {
        if number > largest {
            largest = number
        }
    }
}

print(largest)


// ---- Looping it up

var firstForLoop = 0
for i in 0...4 {   // ... doesn't omit final value ..< does - range basically
    firstForLoop += 1
}

print(firstForLoop)

for var i = 0; i < 4; i++ {
    firstForLoop -= 1
}

print(firstForLoop)

while (firstForLoop < 100) {
    firstForLoop += 10
}

print(firstForLoop)

repeat {
    firstForLoop -= 20
} while firstForLoop > 10

print(firstForLoop)


// -- Function and Closure

func greet(name: String, day: String, special: String?) -> String {
    if let specialStr = special {
        return ("Hello \(name), today is \(day) and the specials today are: \(specialStr)")
    } else {
        return ("Hello \(name), today is \(day)")
    }

}

greet("Josh", day: "Monday", special: "beats")


// -- TUPLES!
/*
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
}*/

var myTuple = ("Josh", 31, "Corona, CA")
let (myName, myAge, myLocation) = myTuple

// OR

let myTuple2 = (name: "Josh", age: 31, location: "Corona, CA")
print("The name is \(myTuple2.name)")


// Error handling


// Define custom exceptions
enum nameCheckErrors: ErrorType {
    case NotAJohnson
    case Loser
    case 💩Face
}



func isJohnson(name: String!) throws -> Bool {
    if (name.hasPrefix("Johnson")) {
        return true
    } else {
        throw nameCheckErrors.NotAJohnson
    }
}

do {
    try isJohnson("Josh")
} catch nameCheckErrors.NotAJohnson {
    print("HE IS NOT A JOHNSON - SHAME")
}


print("\r\r\r")
// --- Generics --- //
protocol Breathable {
    func breathe()
}

protocol Mammal : Breathable, CustomStringConvertible {
    var name: String { get set }
    var gender: Gender { get set}
    var noiseAction: String { get }
    func think()
    func die()
}

enum Gender {
    case Male
    case Female
}

struct Dog : Mammal {
    var name: String
    var gender: Gender
    var isHappy: Bool = true
    var noiseAction: String {
        get {
            return "barks"
        }
    }
    func breathe() {}
    func think() {}
    func die() {}
    
}

struct Human : Mammal {
    var name: String
    var gender: Gender
    var isHappy: Bool = true
    var noiseAction: String {
        get {
            return "says"
        }
    }
    func breathe() {}
    func think() {}
    func die() {}
}


struct Couple {
    var participants: [Mammal] = []
}

extension Mammal {
    func makeNoise<T: Mammal>(myMammal: T, noise: String="nothing") {
        print("\(myMammal) \(myMammal.noiseAction) \(noise)")
    }
    
    var description: String {
        get {
            return self.name
        }
    }
}

let manuel: Human = Human(name: "Manuel", gender: .Male, isHappy: true)
let miguel: Human = Human(name: "Miguel", gender: .Male, isHappy: false)
let susan: Human = Human(name: "Susan", gender: .Female, isHappy: true)
let barkles: Dog = Dog(name: "Barkles", gender: .Female, isHappy: true)

let bigFamily: Couple = Couple(participants: [manuel, miguel, susan, barkles])

// Downcast and pass type to generic
for mammal in bigFamily.participants {
    if let mammal: Mammal = mammal {
        switch mammal {
        case let humie as Human:
           humie.makeNoise(humie, noise: "Howdy")
        case let pup as Dog:
           pup.makeNoise(pup, noise: "woof")
        default:
            continue
        }

    }
}



let j = arc4random() % (24) + 0

extension Array {
    func getRandomElement() -> Generator.Element? {
        guard self.count > 0  else {
            return nil
        }

        let itemCount: Int = self.count.hashValue
        let randLocation = Int(arc4random()) % (itemCount) + 0
        
        return self[randLocation]
    }
}

