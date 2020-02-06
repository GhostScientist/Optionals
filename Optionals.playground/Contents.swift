// Optionals
// iOS MVD Course
// Created by Dakota Kim on 2/6/2020

// Optionals are a type, similar to nullable values from Kotlin or
// If a variable is optional, it will either have a value or none at all.
// If a variable is not optional, you can be sure it holds an integer value.

var age : Int = 4 // Every person has an age.

var favoriteNumber : Int? = nil // Not every person has a favorite number!

favoriteNumber = 0 // Even when we assign a value to this variable, the type is still Int?

// Think of an optional like a box for whatever type it can contain.
// A box can either contain the value or be empty.

// Working with Optionals

// In order to ensure that your application is handling null values and optionals correctly,
// Swift provides several techniques to handle these situations.

// Forced Unwrapping - "I know for sure the box has something in it, let's break open that box and use whatever is inside.
// If it doesn't, we can't handle that, and everything breaks"
//
// Forced unwrapping should be avoided unless you are ABSOLUTELY certain it will contain a value
// at that point. If it does not, your app will crash. You can force unwrap an optional
// using the ! operator at the end of the variable name.

var favoriteColor : String? = "Mint"

print("My favorite color is \(favoriteColor!)") // Since we know for certain this optional contains a value, this is okay.

// ------------------------

// Optional Binding - "I think the box has something in it, so let's openly it slowly. If it has a value, let's assign it to a non-optional variable. If not, we'll handle the nil."
//
// This is a better approach than force unwrapping as it gives developers a say in how their app should handle the nil.
// Optional binding is the recommended way of unwrapping optionals.
// This method is safer than force unwrapping and implicit unwrapping.

var favoriteBeatlesSong : String? = "Lucy in the Sky with Diamonds"

if let beatlesSong = favoriteBeatlesSong {
    // The above statement checks if favoriteBeatlesSong contains a value, and if it does, it will assign it to the constant beatlesSong.
    // You can use if var beatlesSong as well if you want to change the variable containing the unwrapped value.
    print("My favorite song by the Beatles is \(beatlesSong)")
} else {
    // If favoriteBeatlesSong is nil, it will execute this block.
    print("I'm not a fan of the Beatles.")
}

// The above solution helps us unwrap the optional into a value that we can use within these codeblocks. But once the if-else block has been executed, the
// constant is no longer in memory/able to be used elsewhere.
// We have another tool to safely unwrap these optionals and use the resulting data elsewhere in our applications.

var middleName : String? = "Cory"

func shoutMiddleName(optionalMiddleName: String?) {
    guard let middleName = optionalMiddleName else { return } // If optionalMiddleName is nil, the method exits here.
    print("HELLO WORLD, I HAVE A MIDDLE NAME, AND IT'S \(middleName)!!")
    
    // So we can use middleName outside of the 'if let' and 'else' code blocks from the previous example.
}

// ------------------------

// Nil coalescing
// Sometimes there are instances where we want to use a default value when handling nils.

var firstName : String? = "Dakota"

let unwrappedFirtName = firstName ?? "Anonymous"

print("My first name is \(unwrappedFirtName)")
// If there is a last name, we will assign it to unwrappedLastName. If the optional is nil, we assign a default last name of Smith.
// The '??' is known as the nil-coalescing operator. So when we reference unwrappedFirstName, we will DEFINITELY be working with a non-optional type.

// ------------------------

// Optional chaining
// "Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil.
// If the optional contains a value, the property, method, or subscript call succeeds; if the optional is nil, the property,
// method, or subscript call returns nil. Multiple queries can be chained together, and the entire chain fails gracefully if
// any link in the chain is nil." - Swift.org
// Couldn't have said it better myself! Optional chain

class Person {
    var computer: Computer?
}

class Computer {
    var numberOfCPUS = 16
}

let dakota = Person()

let computationalDevice = Computer()

dakota.computer = computationalDevice

if let numCPUs = dakota.computer?.numberOfCPUS {
    print("My name is Dakota, and I have a computer with \(numCPUs) CPUs!")
} else {
    print("I have a rock with electricity running through it.")
}


