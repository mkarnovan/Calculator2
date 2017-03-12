//
//  CalculatorBrain.swift
//  calculator
//
//  Copyright © 2017 Илья Лошкарёв. All rights reserved.
//

import Foundation

let mLength: Double = 1000000


prefix operator √ {}

prefix operator ±{}

postfix operator %{}

class CalculatorBrain {
    
    var acc : Double = 0
    
    public var result : Double {
        get{
            return acc
        }
        set{
            acc = newValue
        }
    }
    
    static func +(_ c: CalculatorBrain, _ d: Double) throws -> CalculatorBrain {
        guard c.result + d < mLength else {
            throw Exeptions.longNumber("It is so long")
        }
        c.result += d
        return c
    }
    
    static func -(_ c: CalculatorBrain, _ d: Double) throws -> CalculatorBrain {
        guard c.result - d > -mLength else {
            throw Exeptions.longNumber("It is so long")
        }
        c.result -= d
        return c
    }
    
    static func *(_ c: CalculatorBrain, _ d: Double) throws -> CalculatorBrain {
        guard c.result * d < mLength else {
            throw Exeptions.longNumber("It is so long")
        }
        c.result *= d
        return c
    }
    
    static func /(_ c: CalculatorBrain, _ d: Double) throws -> CalculatorBrain {
        guard d * 2 > 0.00000000000000001 else {
            throw Exeptions.divideByZero("Divide by zero")
        }
        c.result /= d
        return c
    }
    
    static prefix func √(_ c: CalculatorBrain) throws {
        guard c.result >= 0 else {
            throw Exeptions.natural("Number must be more than 0")
        }
        c.result = sqrt(c.result)
    }
    
    static prefix func ±(_ c:CalculatorBrain) {
        c.result = -c.result
    }
    
    static postfix func %(_ c: CalculatorBrain) throws {
        guard c.result >= 0 else {
            throw Exeptions.natural("Number must be more than 0")
        }
        c.result = c.result / 100
    }
    
}
