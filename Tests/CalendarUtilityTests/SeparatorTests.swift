import XCTest
@testable import CalendarUtility

final class SeparatorTests: XCTestCase {
  let calendar = Calendar(identifier: .gregorian)
  let timeZone = TimeZone(abbreviation: "GMT+8")!
  
  func testSeparatingFrom20191001To20191012ByCount7ReturnExtracted5RemainedIs7UsefulExtractedIs5() {
    let startDate = createDate(calendar: calendar, year: 2019, month: 10, day: 01)
    let endDate = createDate(calendar: calendar, year: 2019, month: 10, day: 12)
    let contexts = DateContextGenerator.make(calendar: calendar, startDate: startDate, endDate: endDate)
    let separating = Separator.separating(rawValue: ArraySlice(contexts))
    
    XCTAssertEqual(separating.extracted.count, 7)
    XCTAssertEqual(separating.remained.count, 7)
    XCTAssertEqual(separating.usefulExtracted.count, 5)
  }
  
  func testSeparatingWeeksFromOctober() {
    let startDate = createDate(calendar: calendar, year: 2019, month: 10, day: 01)
    let endDate = createDate(calendar: calendar, year: 2019, month: 10, day: 31)
    let contexts = DateContextGenerator.make(calendar: calendar, startDate: startDate, endDate: endDate)
    
    let weekContexts = Separator.weekContexts(rawValue: ArraySlice(contexts))
    
    XCTAssertTrue(weekContexts.allSatisfy { $0.monthInfo == .placeholder })
    XCTAssertTrue(weekContexts.allSatisfy { $0.weekOfMonth == 0 })
    XCTAssertEqual(weekContexts.count, 5)
  }
  
  func testApplyMonthInfoFromOctober() {
    let startDate = createDate(calendar: calendar, year: 2019, month: 10, day: 01)
    let endDate = createDate(calendar: calendar, year: 2019, month: 10, day: 31)
    let contexts = DateContextGenerator.make(calendar: calendar, startDate: startDate, endDate: endDate)
    
    let notApplyWeekContexts = Separator.weekContexts(rawValue: ArraySlice(contexts))
    let info = MonthInfo(name: "October", weeksCount: 5)
    let result = applyMonthInfo(info)(notApplyWeekContexts)

    XCTAssertTrue(result.allSatisfy { $0.monthInfo != .placeholder })

    for (index, week) in result.enumerated() {
      XCTAssertEqual(week.weekOfMonth, index + 1)
    }
    
    XCTAssertEqual(result.count, 5)
  }
  
  func testEngineRun() {
    let startDate = createDate(calendar: calendar, year: 2019, month: 01, day: 01)
    let endDate = createDate(calendar: calendar, year: 2019, month: 12, day: 31)
    let engine = CalendarEngine(calendar: calendar, timeZone: .current, startDate: startDate, endDate: endDate)
    engine.run()
    engine.prettyPrint()
  }
  
  static var allTests = [
    ("testSeparatingFrom20191001To20191012ByCount7ReturnExtracted5RemainedIs7UsefulExtractedIs5", testSeparatingFrom20191001To20191012ByCount7ReturnExtracted5RemainedIs7UsefulExtractedIs5),
    ("testSeparatingWeeksFromOctober", testSeparatingWeeksFromOctober),
    ("testApplyMonthInfoFromOctober", testApplyMonthInfoFromOctober)
  ]
}
