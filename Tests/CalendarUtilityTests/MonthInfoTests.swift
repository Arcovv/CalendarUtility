import XCTest
@testable import CalendarUtility

final class MonthInfoTests: XCTestCase {
  
  func testNameAssigned() {
    let name = "January"
    let sut = MonthInfo(name: name, weeksCount: 5)
    XCTAssertEqual(sut.name, name)
  }
  
  func testWeeksCountAssigned() {
    let weeksCount = 5
    let sut = MonthInfo(name: "January", weeksCount: weeksCount)
    XCTAssertEqual(sut.weeksCount, weeksCount)
  }
  
}
