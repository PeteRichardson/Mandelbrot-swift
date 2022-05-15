//
//  Mandelbrot_swiftTests.swift
//  Mandelbrot-swiftTests
//
//  Created by Peter Richardson on 5/14/22.
//

import XCTest
@testable import Mandelbrot_swift

class Mandelbrot_swiftTests: XCTestCase {

    func testPointToPixel() throws {
        XCTAssert(Complex(2.0, 3.0) == PointToPixel(Point(2,100)))
    }

}
