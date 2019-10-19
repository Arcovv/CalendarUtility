import XCTest
@testable import CalendarUtility

final class CalendarUtilityTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CalendarUtility().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
