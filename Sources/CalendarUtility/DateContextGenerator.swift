import Foundation

public struct DateContextGenerator {
  
  /// Generate date contexts between two days.
  /// - **NOTE**: startDate should smaller or equal with endDate, otherwise return empty array.
  /// - Parameter calendar: The Calendar object
  /// - Parameter startDate: The started date
  /// - Parameter endDate: The ended date
  public static func make(calendar: Calendar = .current, startDate: Date, endDate: Date) -> [DateContext] {
    guard startDate <= endDate else {
      return []
    }
    
    var result = [DateContext(date: startDate)]
    
    if startDate == endDate {
      return result
    }
    
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
