//
//  string_colorize.swift
//  ColorMeAnsi
//
//  Created by Ivan M on 12/7/14.
//  Copyright (c) 2014 3boxed. All rights reserved.
//

import Foundation

extension String {
    
    enum Color : String {
        case RED     = "\u{001B}[0;31m"
        case GREEN   = "\u{001B}[0;32m"
        case YELLOW  = "\u{001B}[0;33m"
        case BLUE    = "\u{001B}[0;34m"
        case MAGENTA = "\u{001B}[0;35m"
        case CYAN    = "\u{001B}[0;36m"
        case WHITE   = "\u{001B}[0;37m"
        case NONE    = "\u{001B}[0m"
        
        static let allValues = [
            "RED":RED,
            "GREEN":GREEN,
            "YELLOW":YELLOW,
            "BLUE":BLUE,
            "MAGENTA":MAGENTA,
            "CYAN":CYAN,
            "WHITE":WHITE,
            "NONE":NONE
        ]
    }
    
    func colorize(let color: Color) -> String {
        return "\(color.rawValue)\(self)\(Color.NONE.rawValue)"
    }
    
    static func colorize(let pattern: String, args: String...) -> String {

        var substitution = pattern
        
        /* poor man's color substitution */
        for color:String in Color.allValues.keys {
            let match = "{\(color)}"
            let replacement = Color.allValues[color]!.rawValue
            substitution = substitution.stringByReplacingOccurrencesOfString(match, withString: replacement)
        }
        

        /* poor man's argument substitution */
        for item in args {
            if let range = substitution.rangeOfString("%@") {
                substitution.replaceRange(range, with: item)
            }
        }
        
        /* reset color */
        return substitution.stringByAppendingString(Color.NONE.rawValue)
    }
}
