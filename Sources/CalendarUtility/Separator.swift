public enum Separator {
  
  public static func separating(rawValue contexts: ArraySlice<DateContext>) -> DateContextSeparating {
    let daysOfWeek = 7
    var result = Array(repeating: DateContext.placeholder, count: daysOfWeek)
    
    for context in contexts {
      // Fill the weekly days array by weekday index.
      result[context.weekdayIndex] = context
      
      // When context is SAT, the result is whole filled.
      if context.weekdayIndex == result.count - 1 {
        break
      }
      
      // When context is the last day, should ignore the remained elements.
      if context.isLastDayOfThisMonth {
        break
      }
    }
    
    let remainedContexts = contexts.dropFirst(result.filter(isNotFake).count)
    return DateContextSeparating(
      extracted: ArraySlice(result),
      remained: remainedContexts
    )
  }
  
  public static func weekContexts(rawValue dateContexts: ArraySlice<DateContext>) -> [WeekContext] {
    var result: [WeekContext] = []
    
    var separating = Separator.separating(rawValue: dateContexts)
    result.append(WeekContext(days: Array(separating.extracted)))

    while !separating.remained.isEmpty {
      separating = Separator.separating(rawValue: separating.remained)
      result.append(WeekContext(days: Array(separating.extracted)))
    }
    
    return result
  }
  
  public static func monthContexts(weekContexts: [WeekContext], monthInfos: [MonthInfo]) -> [MonthContext] {
    var monthContexts: [MonthContext] = []
    var weekContextsSlice = ArraySlice(weekContexts)

    for monthInfo in monthInfos {
      let weeks = weekContextsSlice.prefix(monthInfo.weeksCount)
      let context = MonthContext(
        info: monthInfo,
        weeks: applyWeekOfMonth(weeksCount: monthInfo.weeksCount)(Array(weeks))
      )
      monthContexts.append(context)
      weekContextsSlice = weekContextsSlice.dropFirst(monthInfo.weeksCount)
    }
    
    return monthContexts
  }
  
}

public struct DateContextSeparating {
  public var extracted: ArraySlice<DateContext>
  public var remained: ArraySlice<DateContext>
  public var usefulExtracted: ArraySlice<DateContext> {
    extracted.filter { !$0.isPlaceholder }
  }
}
