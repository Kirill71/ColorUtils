//
//  UnitTests.swift
//  UnitTests
//
//  Created by Kyrylo Zharenkov on 3/6/20.
//  Copyright © 2020 Kyrylo Zharenkov. All rights reserved.
//

import XCTest
@testable import ColorUtils

class ColorUtilsTestSuite: XCTestCase {

    func testRGBAInit() {
        let rgba = ColorRGBA(r: 43, g: 255, b: 255, a: 255)
        
        XCTAssertEqual(43, rgba.r)
        XCTAssertEqual(255, rgba.g)
        XCTAssertEqual(255, rgba.b)
        XCTAssertEqual(255, rgba.a)
    }
    
    func testHSLInit() {
        let hsl = ColorHSL(h: 0.3, s: 0.2, l: 0.1)
        
        XCTAssertEqual(0.3, hsl.h)
        XCTAssertEqual(0.2, hsl.s)
        XCTAssertEqual(0.1, hsl.l)
    }

}
