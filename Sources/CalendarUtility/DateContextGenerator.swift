import Foundation

struct DateContextGenerator {
  static func make(calendar: Calendar = .current, startDate: Date, endDate: Date) -> [DateContext] {
    var result = [DateContext(date: startDate)]
    var nextDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
    
    repeat {
      let dateContext = DateContext(date: nextDate)
      result.append(dateContext)
      nextDate = calendar.date(byAdding: .day, value: 1, to: nextDate)!
    } while nextDate != endDate
    
    let dateContext = DateContext(date: endDate)
    result.append(dateContext)
    return result
  }
}
