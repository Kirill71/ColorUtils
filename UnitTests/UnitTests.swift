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
    
    func testConvertFromRgbaToHsl() {
        
        let rgba = ColorRGBA(r: 47, g: 25, b: 123, a: 255)
        let hsl = convertToHSL(rgba: rgba)
        
        XCTAssertEqual(0.7040816326530613, hsl.h)
        XCTAssertEqual(0.6621621621621622, hsl.s)
        XCTAssertEqual(0.2901960784313726, hsl.l)
    }
    
    func testConvertFromHslToRgba() {
        let hsl = ColorHSL(h: 0.7040816326530613, s: 0.6621621621621622, l: 0.2901960784313726)
        
        let rgba = convertToRGBA(hsl: hsl)
        
        XCTAssertEqual(47, rgba.r)
        XCTAssertEqual(24, rgba.g)
        XCTAssertEqual(123, rgba.b)
        XCTAssertEqual(255, rgba.a)
        
    }
    
}
