import Foundation
let apples = 3
let oranges = 4
let appleSummary = "I have \(apples) apples and \(oranges) oranges"
let fruits = "i have \(apples + oranges) fruits"

let quotation = """
Even thought ther eis
somethign
other lines?
I still have \(apples)apples 
"""
print(quotation)


//dictionary and arrays

var myFruits = ["strawberrits", "limes", "tangerines"]
print(myFruits)
myFruits[1] = "grapes"
print(myFruits)

var occupations = ["Malcom": "Captain", "Kay":" Mech"]
print(occupations)
occupations["Jaybe"] = "tailor"
print(occupations)

let emptyArray: [String] = []
let emptyDictionary: [String:[Int]] = [:]

let individualScores = [75,43, 103, 200]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
        
    } else {
        teamScore += 1
    }
}

let scoreDecor = if teamScore >= 10{
    "✌"
}else{
    "😥"
}

print("score: ", teamScore,scoreDecor)

//for optionals
var optionalString: String? = nil
print(optionalString == nil)

var optionalName: String? = nil
var greeting  = "Hello!"
if let name = optionalName{
    greeting = "Hello \(name)"
} else { greeting = "bye"}
print(greeting)


let nichkname:String? = nil
let fullName :String = "john apple"
let informalGreeting = "Hi \(nichkname ?? fullName)"

if let nichkname{
    print("Hey \(nichkname)")
    
}

let vegetable = "red pepper"
switch vegetable{
case "celery": print("add some raising and make ants on a log")
case "cucumber", "watercress":
    print("nothing")
case let x where x.hasSuffix("pepper"):
    print("is it a spicy \(x)?")
default: print("everything tastes good in soup")
}




let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
    ]
var largest = 0
for (show,i) in interestingNumbers{
    for j in i {
        if j > largest{
            largest = j
        }

    }
    print(show)
}
print(largest)

//while loop
var n = 2
while n<0{
    n*=2
}

print(n)

var m = 2
repeat{
    m *= 2
}while m < 0
print(m)


var total = 0
for i in 0...4 {
    total += i
}
print(total)



//functions and classes

func greet(person:String, day:String) -> String{
    return "Hello \(person), today is \(day)."
    
}
greet(person: "Bob", day: "Monday")

func calculateStatistics(scores: [Int])-> (min: Int, max: Int, sum: Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max{
            max = score
        } else if score < min {min = score}
        sum += score
    }
    return( min, max, sum)
}

let statistics = calculateStatistics(scores: [5,3,100,3,9])
print(statistics)

//Objects and Classes

class Shape{
    var numberOfSides = 0
    let shapeName: String = "Polygon"
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    func anotherFunction() -> String {
        return "shape name is \(shapeName)"
    }
}

var shape = Shape()
shape.numberOfSides = 7
print(shape.anotherFunction())
print(shape.simpleDescription()
)

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(numberOfSides: Int, name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}
var anotherShape = NamedShape(numberOfSides: 7, name: "something")
print(anotherShape.name)

//overriding a function

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name : String) {
        self.sideLength = sideLength
        super.init( numberOfSides: 4, name: name)
    }
    
    func area()-> Double{
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
    
    
}
let test = Square(sideLength: 5.3, name: "my test square")
test.area()
test.simpleDescription()

class EquilateralTriangle : NamedShape {
    var sidelenth  : Double = 0.0
    
    init(sideLength: Double, name: String)
    {
        self.sidelenth = sideLength
        super.init(numberOfSides: 3, name: "equilateral traingle ")
    }
}

class TriangleAndSquare{
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sidelenth
        }
    }
    var square: Square {
        willSet {
            triangle.sidelenth = newValue.sideLength
        }
    }
}
