import Foundation

public struct DateContext {
  let calendar: Calendar
  let timeZone: TimeZone
  let date: Date
  let dateComponents: DateComponents
  
  var weekday: Int {
    calendar.component(.weekday, from: date)
  }
  
  var weekdayIndex: Int {
    weekday - 1
  }
  
  var weekOfMonth: Int {
    calendar.component(.weekOfMonth, from: date)
  }
  
  var day: Int {
    calendar.component(.day, from: date)
  }
  
  var month: Int {
    calendar.component(.month, from: date)
  }
  
  var year: Int {
    calendar.component(.year, from: date)
  }
  
  var firstDayOfNextMonth: Date {
    let thisMonthFirstDateComponentsFragment = DateComponents(year: year, month: month)
    let thisMonthFirstDayFragment = calendar.date(from: thisMonthFirstDateComponentsFragment)!
    let nextMonthFirstDay = calendar.date(byAdding: .month, value: 1, to: thisMonthFirstDayFragment)!
    return nextMonthFirstDay
  }
  
  var lastDayOfThisMonth: Date {
    let lastDayOfThisMonth = calendar.date(byAdding: .day, value: -1, to: firstDayOfNextMonth)!
    return lastDayOfThisMonth
  }
  
  var isLastDayOfThisMonth: Bool {
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

extension DateContext: CustomStringConvertible {

  public var description: String {
    isFake ? "  " : calendarDayDisplayString(fromDay: day)
  }

}
