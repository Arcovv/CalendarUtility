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
    var monthWithWeeks: [ArraySlice<DateContext>] = []
    let daysCountAWeek = 7
    
    var separating = DateContextSeparator.separating(rawValue: ArraySlice(dateContexts), by: daysCountAWeek)
    monthWithWeeks.append(separating.extracted)

    while !separating.remained.isEmpty {
      separating = DateContextSeparator.separating(rawValue: separating.remained, by: daysCountAWeek)
      monthWithWeeks.append(separating.extracted)
    }
    
    let monthInfos = MonthInfoGenerator.make(calendar: calendar, timeZone: timeZone, startAt: startDate)
    var monthContexts: [MonthContext] = []
    var monthWithWeeksSlice = ArraySlice(monthWithWeeks)

    for monthInfo in monthInfos {
      let weeks = monthWithWeeksSlice.prefix(monthInfo.weeksCount)
      let context = MonthContext(
        info: monthInfo,
        weeks: weeks
      )
      monthContexts.append(context)
      monthWithWeeksSlice = monthWithWeeksSlice.dropFirst(monthInfo.weeksCount)
    }
    
    return monthContexts
  }
  
  public func prettyPrint() {
    for context in monthContexts {
      print(context.info.name.uppercased())

      for week in context.weeks {
        let weekString = week
          .map { $0.prettyDisplay }
          .joined(separator: " ")
        print(weekString)
      }

      print("==================")
    }
  }
}
