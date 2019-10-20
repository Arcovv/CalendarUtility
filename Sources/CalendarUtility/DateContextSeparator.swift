public enum DateContextSeparator {
  
  public static func separating(rawValue contexts: ArraySlice<DateContext>, by count: Int) -> DateContextSeparating {
    var result = Array(repeating: DateContext.fake, count: count)
    
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
  
}

public struct DateContextSeparating {
  public var extracted: ArraySlice<DateContext>
  public var remained: ArraySlice<DateContext>
}
