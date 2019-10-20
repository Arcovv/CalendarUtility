import XCTest
@testable import CalendarUtility

final class DateContextGeneratorTests: XCTestCase {
  
  let calendar = Calendar(identifier: .gregorian)
  
  func testFrom20191006To20191019CountIs14() {
    let startDate = createDate(year: 2019, month: 10, day: 06)
    let endDate = createDate(year: 2019, month: 10, day: 19)
    let sut = DateContextGenerator.make(calendar: calendar, startDate: startDate, endDate: endDate)
    
    XCTAssertEqual(sut.count, 14)
  }
  
  func testStartDateIsTheSameWithEndDateCountIs1() {
    let startDate = createDate(year: 2019, month: 10, day: 06)
    let endDate = startDate
    let sut = DateContextGenerator.make(calendar: calendar, startDate: startDate, endDate: endDate)
    
    XCTAssertEqual(sut.count, 1)
  }
  
  func testEndDateIsSmallerThanStartDateCount0() {
    let endDate = createDate(year: 2019, month: 10, day: 06)
    let startDate = createDate(year: 2019, month: 10, day: 19)
    let sut = DateContextGenerator.make(calendar: calendar, startDate: startDate, endDate: endDate)
    
    XCTAssertEqual(sut.count, 0)
  }
  
  static var allTests = [
    ("testFrom20191006To20191019CountIs14", testFrom20191006To20191019CountIs14),
    ("testStartDateIsTheSameWithEndDateCountIs1", testStartDateIsTheSameWithEndDateCountIs1),
    ("testEndDateIsSmallerThanStartDateCount0", testEndDateIsSmallerThanStartDateCount0)
  ]
}
