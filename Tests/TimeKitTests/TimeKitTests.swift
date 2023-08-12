import XCTest
@testable import TimeKit

final class TimeKitTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TimeKit().text, "Hello, World!")
    }
}
