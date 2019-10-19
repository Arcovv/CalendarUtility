import XCTest
@testable import CalendarUtility

final class CalendarUtilityTests: XCTestCase {
  func testExample() {
    let startDate = createDate(year: 2019, month: 01, day: 01)
    let endDate = createDate(year: 2019, month: 12, day: 31)
    let engine = CalendarEngine(startDate: startDate, endDate: endDate)
    
    engine.run()
    engine.prettyPrint()
  }
  
  static var allTests = [
    ("testExample", testExample),
  ]
}
