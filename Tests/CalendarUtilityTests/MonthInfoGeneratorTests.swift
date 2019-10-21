import XCTest
@testable import CalendarUtility

final class MonthInfoGeneratorTests: XCTestCase {
  
  let calendar = Calendar(identifier: .gregorian)
  let timeZone = TimeZone(abbreviation: "GMT+8")!
  
  func test2019Year() {
    let startDate = createDate(calendar: calendar, year: 2019, month: 01, day: 01)
    let infos = MonthInfoGenerator.make(calendar: calendar, timeZone: timeZone, startAt: startDate)
    
    let result = zip(calendar.monthSymbols, infos.map { $0.name })
    XCTAssertTrue(result.allSatisfy { $0.0 == $0.1 })
  }
  
}
