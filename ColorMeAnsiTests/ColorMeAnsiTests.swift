//
//  ColorMeAnsiTests.swift
//  ColorMeAnsiTests
//
//  Created by Ivan M on 12/7/14.
//  Copyright (c) 2014 3boxed. All rights reserved.
//

import Cocoa
import XCTest

class ColorMeAnsiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testColorOutput() {
        let text:String = "Give Me Red"
        XCTAssertEqual(text.colorize(.RED), "\u{001B}[0;31mGive Me Red\u{001B}[0m")
    }
    
    func testStringBuilderOutput() {
        let expected = "\u{001B}[0;31mGive Me Red, \u{001B}[0;32mGreen, or \u{001B}[0;34mBlue\u{001B}[0m"
        XCTAssertEqual(String.colorize("{RED}%@{GREEN}%@{BLUE}%@", args: "Give Me Red, ", "Green, or ", "Blue"), expected)
    }
    
    func testPerformanceConcatenation() {
        let header  = "01/01/2001"
        let warning = "WARNING"
        let details = "This is your final warning before we bring out the sad clowns"
        let pattern = "{BLUE}%@ {YELLOW}%@ {NONE}%@"

        /* concatenating colorized strings */
        self.measureBlock() {
            for i in 0..<10 {
                let output = "\(header.colorize(.BLUE)) \(warning.colorize(.YELLOW)) \(details.colorize(.NONE))"
            }
            return
        }
    }

    func testPerformanceFormatString() {
        let header  = "01/01/2001"
        let warning = "WARNING"
        let details = "This is your final warning before we bring out the sad clowns"
        let pattern = "{BLUE}%@ {YELLOW}%@ {NONE}%@"
        
        /* templating is slow.. */
        self.measureBlock() {
            for i in 0..<10 {
                let output = String.colorize(pattern, args: header, warning, details)
            }
            return
        }
    }
}
