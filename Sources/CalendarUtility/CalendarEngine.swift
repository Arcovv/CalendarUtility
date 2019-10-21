import Foundation

public final class CalendarEngine {
  
  public let calendar: Calendar
  public let timeZone: TimeZone
  public let startDate: Date
  public let endDate: Date
  
  public private(set) var dateContexts: [DateContext] = []
  public private(set) var monthContexts: [MonthContext] = []
  
  public init(
    calendar: Calendar = .current,
    timeZone: TimeZone = .current,
    startDate: Date,
    endDate: Date)
  {
    self.calendar = calendar
    self.timeZone = timeZone
    self.startDate = startDate
    self.endDate = endDate
  }
  
  public func run() {
    if dateContexts.isEmpty {
      dateContexts = generateDateContexts()
    }
    
    if monthContexts.isEmpty {
      monthContexts = generateMonthContexts()
    }
  }
  
  private func generateDateContexts() -> [DateContext] {
    return DateContextGenerator.make(calendar: calendar, startDate: startDate, endDate: endDate)
  }
  
  private func generateMonthContexts() -> [MonthContext] {
    let weekContexts = Separator.weekContexts(rawValue: ArraySlice(dateContexts))
    
    let monthInfos = MonthInfoGenerator.make(calendar: calendar, timeZone: timeZone, startAt: startDate)
    
    let monthContexts = Separator.monthContexts(weekContexts: weekContexts, monthInfos: monthInfos)
    
    return monthContexts
  }
  
  public func prettyPrint() {
    for context in monthContexts {
      print(context.info.name.uppercased())

      for week in context.weeks {
        
        let weekString = week.days
          .map { $0.prettyDisplay }
          .joined(separator: " ")
        print(weekString)
      }

      print("==================")
    }
  }
}
