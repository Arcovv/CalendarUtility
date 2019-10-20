import Foundation

public struct MonthInfoGenerator {
  
  /// Get month contexts
  /// - Parameter calendar: Set the calendar
  /// - Parameter timeZone: Set the time zone
  /// - Parameter date: Month contexts after the date (included)
  public static func make(calendar: Calendar = .current, timeZone: TimeZone = .current, startAt date: Date) -> [MonthInfo] {
    var result: [MonthInfo] = []
    var copyDate = date
    let months = calendar.monthSymbols

    for name in months {
      let dateHelper = DateContext(calendar: calendar, timeZone: timeZone, date: copyDate)
      let lastDayOfThisMonth = dateHelper.lastDayOfThisMonth
      let weeksCount = calendar.component(.weekOfMonth, from: lastDayOfThisMonth)
      let context = MonthInfo(name: name, weeksCount: weeksCount)
      result.append(context)
      
      copyDate = dateHelper.firstDayOfNextMonth
    }
    
    return result
  }
}
