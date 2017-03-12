//
//  Exceptions.swift
//  calculator
//
//  Copyright © 2017 Илья Лошкарёв. All rights reserved.
//

import Foundation

enum Exeptions: Error {
    case longNumber(String)
    case divideByZero(String)
    case natural(String)
}
