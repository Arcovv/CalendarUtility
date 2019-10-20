import Foundation

public struct DateContext {
  public let calendar: Calendar
  public let timeZone: TimeZone
  public let date: Date
  public let dateComponents: DateComponents
  
  public var weekday: Int {
    calendar.component(.weekday, from: date)
  }
  
  public var weekdayIndex: Int {
    weekday - 1
  }
  
  public var weekOfMonth: Int {
    calendar.component(.weekOfMonth, from: date)
  }
  
  public var day: Int {
    calendar.component(.day, from: date)
  }
  
  public var month: Int {
    calendar.component(.month, from: date)
  }
  
  public var year: Int {
    calendar.component(.year, from: date)
  }
  
  public var firstDayOfNextMonth: Date {
    let thisMonthFirstDateComponentsFragment = DateComponents(year: year, month: month)
    let thisMonthFirstDayFragment = calendar.date(from: thisMonthFirstDateComponentsFragment)!
    let nextMonthFirstDay = calendar.date(byAdding: .month, value: 1, to: thisMonthFirstDayFragment)!
    return nextMonthFirstDay
  }
  
  public var lastDayOfThisMonth: Date {
    let lastDayOfThisMonth = calendar.date(byAdding: .day, value: -1, to: firstDayOfNextMonth)!
    return lastDayOfThisMonth
  }
  
  public var isLastDayOfThisMonth: Bool {
    return lastDayOfThisMonth == date
  }
  
  public let isFake: Bool
  
  public init(calendar: Calendar = .current, timeZone: TimeZone = .current, date: Date = .init(), isFake: Bool = false) {
    self.calendar = calendar
    self.timeZone = timeZone
    self.date = date
    self.dateComponents = calendar.dateComponents(in: timeZone, from: date)
    self.isFake = isFake
  }

  static let fake = DateContext(isFake: true)
}

extension DateContext {

  public var prettyDisplay: String {
    isFake ? "  " : calendarDayDisplayString(fromDay: day)
  }

}
