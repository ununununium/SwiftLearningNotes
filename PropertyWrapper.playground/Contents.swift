//Book page 196


@propertyWrapper
struct TwelvewOrLess{
    private var maximum: Int
    private var number: Int
    var projectedValue = false
    
    /**
     asaksjkasjkas
     
     - Returns: nothing
     
     */
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int){
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    
    /**
     asaksjkasjkas
     
     - Parameters:
        - wrappedValue: this is wv
        - maximum: This is max
     - Returns: nothing
     
     */
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
    
    var wrappedValue: Int{
        get{ return number }
        set{
            if(newValue > maximum){
                projectedValue = true
                number = maximum
            }else{
                projectedValue = false
                number = newValue
            }
        }
        
    }
    
}



/**
 Foo uses propertyWrapper implicitly by using @
 */

struct Foo{
    @TwelvewOrLess () var s0
    @TwelvewOrLess (wrappedValue: 88) var s01
    @TwelvewOrLess (maximum: 90) var s1 = 88
    @TwelvewOrLess (wrappedValue: 100, maximum: 20) var s2
    @TwelvewOrLess (maximum: 20) var s3 = 99
//    @TwelvewOrLess (maximum: 20) var s4_BAD
//    @TwelvewOrLess (wrappedValue: 99,maximum: 20) var s5_BAD =199
}


/**
 Foo uses propertyWrapper explicitly by constructing the wrapper use ()
 */

struct Bar{
    private var _s0 = TwelvewOrLess()
    private var _s1 = TwelvewOrLess()
    
    var s0: Int{
        get{ return _s0.wrappedValue }
        
        //newValue is the default parameter name for set function
        set{ _s0.wrappedValue = newValue}
    }
    
    var s1: Int{
        get{ return _s1.wrappedValue }
        set(myNewValue){ _s1.wrappedValue = myNewValue}
    }

}



var f = Foo()
f.s1 = 100

//use . to access the [wrappedValue]
f.s1

//Use $ to access [projectedValue]
f.$s1

var b = Bar()
b.s0 = 13
b.s0

b.s1 = 6
b.s1
