import XCTest
@testable import CalendarUtility

final class DateContextTests: XCTestCase {
  
  let calendar = Calendar(identifier: .gregorian)
  let timeZone = TimeZone(abbreviation: "GMT+8")!

  func test20191020WeekdayIs1() {
    let target = createDate(year: 2019, month: 10, day: 20)
    let sut = DateContext(calendar: calendar, timeZone: timeZone, date: target)
    
    XCTAssertEqual(sut.weekday, 1)
  }
  
  func test20191020WeekdayIndexIs0() {
    let target = createDate(year: 2019, month: 10, day: 20)
    let sut = DateContext(calendar: calendar, timeZone: timeZone, date: target)
    
    XCTAssertEqual(sut.weekdayIndex, 0)
  }
  
  func test20191020WeekOfMonthIs4() {
    let target = createDate(year: 2019, month: 10, day: 20)
    let sut = DateContext(calendar: calendar, timeZone: timeZone, date: target)
    
    XCTAssertEqual(sut.weekOfMonth, 4)
  }
  
  func test20191020DayIs20() {
    let target = createDate(year: 2019, month: 10, day: 20)
    let sut = DateContext(calendar: calendar, timeZone: timeZone, date: target)
    
    XCTAssertEqual(sut.day, 20)
  }
  
  func test20191020MonthIs10() {
    let target = createDate(year: 2019, month: 10, day: 20)
    let sut = DateContext(calendar: calendar, timeZone: timeZone, date: target)
    
    XCTAssertEqual(sut.month, 10)
  }
  
  func test20191020YearIs2019() {
    let target = createDate(year: 2019, month: 10, day: 20)
    let sut = DateContext(calendar: calendar, timeZone: timeZone, date: target)
    
    XCTAssertEqual(sut.year, 2019)
  }
  
  func test20191020NextMonthFirstDayIs20191101() {
    let dc20191020 = DateContext(calendar: calendar, timeZone: timeZone, date: createDate(year: 2019, month: 10, day: 20))
    let dc20191101 = DateContext(calendar: calendar, timeZone: timeZone, date: createDate(year: 2019, month: 11, day: 01))
    
    XCTAssertEqual(dc20191020.firstDayOfNextMonth, dc20191101.date)
  }
  
  func test20191020ThisMonthLastDayIs20191031() {
    let dc20191020 = DateContext(calendar: calendar, timeZone: timeZone, date: createDate(year: 2019, month: 10, day: 20))
    let dc20191031 = DateContext(calendar: calendar, timeZone: timeZone, date: createDate(year: 2019, month: 10, day: 31))
    
    XCTAssertEqual(dc20191020.lastDayOfThisMonth, dc20191031.date)
  }
  
  func test20191031IsTheLastDayOfOctober() {
    let sut = DateContext(calendar: calendar, timeZone: timeZone, date: createDate(year: 2019, month: 10, day: 31))
    XCTAssertTrue(sut.isLastDayOfThisMonth)
  }
  
  func testIsPlacerholder() {
    let sut = DateContext(isPlaceholder: true)
    XCTAssertTrue(sut.isPlaceholder)
  }
  
  static var allTests = [
    ("test20191020WeekdayIs1", test20191020WeekdayIs1),
    ("test20191020WeekdayIndexIs0", test20191020WeekdayIndexIs0),
    ("test20191020WeekOfMonthIs4", test20191020WeekOfMonthIs4),
    ("test20191020DayIs20", test20191020DayIs20),
    ("test20191020MonthIs10", test20191020MonthIs10),
    ("test20191020YearIs2019", test20191020YearIs2019),
    ("test20191020NextMonthFirstDayIs20191101", test20191020NextMonthFirstDayIs20191101),
    ("test20191020ThisMonthLastDayIs20191031", test20191020ThisMonthLastDayIs20191031),
    ("test20191031IsTheLastDayOfOctober", test20191031IsTheLastDayOfOctober),
    ("testIsPlacerholder", testIsPlacerholder)
  ]
}
