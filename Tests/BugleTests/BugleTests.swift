import XCTest
@testable import Bugle

final class BugleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Bugle().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
