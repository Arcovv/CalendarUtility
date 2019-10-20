import XCTest
@testable import CalendarUtility

final class DateContextSeparatorTests: XCTestCase {
  let calendar = Calendar(identifier: .gregorian)
  let timeZone = TimeZone(abbreviation: "GMT+8")!
  
  func testSeparatingFrom20191001To20191012ByCount7ReturnExtracted5RemainedIs7UsefulExtractedIs5() {
    let startDate = createDate(calendar: calendar, year: 2019, month: 10, day: 01)
    let endDate = createDate(calendar: calendar, year: 2019, month: 10, day: 12)
    let contexts = DateContextGenerator.make(calendar: calendar, startDate: startDate, endDate: endDate)
    let separating = DateContextSeparator.separating(rawValue: ArraySlice(contexts), by: 7)
    
    XCTAssertEqual(separating.extracted.count, 7)
    XCTAssertEqual(separating.remained.count, 7)
    XCTAssertEqual(separating.usefulExtracted.count, 5)
  }
  
  static var allTests = [
    ("testSeparatingFrom20191001To20191012ByCount7ReturnExtracted5RemainedIs7UsefulExtractedIs5", testSeparatingFrom20191001To20191012ByCount7ReturnExtracted5RemainedIs7UsefulExtractedIs5)
  ]
}
