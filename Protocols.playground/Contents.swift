protocol Runnable{
    var speed: Int { get set }
    
    func foo()->()
}

// Constrain the struct to have the variable and function that defined by Runnable
struct MyStruct: Runnable{
    var speed: Int
    
    func foo() {
        print("This is foo")
    }
}

//Gain the funtion that defined in the extension of the protocol
extension Runnable{
    func bar() -> () {
        print("This is bar \(speed)")
    }
}

let f = MyStruct(speed: 12)

f.foo()

//Gained Funtion
f.bar()
