func weeklyDays(with contexts: ArraySlice<DateContext>) -> ([Int], ArraySlice<DateContext>) {
  var result = Array(repeating: 0, count: 7)
  
  for context in contexts {
    // Fill the weekly days array by weekday index.
    result[context.weekdayIndex] = context.day
    
    // When context is SAT, the result is whole filled.
    if context.weekdayIndex == result.count - 1 {
      break
    }
    
    // When context is the last day, should ignore the remained elements.
    if context.isLastDayOfThisMonth {
      break
    }
  }
  
  let remainedContexts = contexts.dropFirst(result.filter(isNotZero).count)
  return (result, remainedContexts)
}

enum DateContextSeparator {
  
  static func separating(rawValue contexts: ArraySlice<DateContext>, by count: Int) -> DateContextSeparating {
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

struct DateContextSeparating {
  var extracted: ArraySlice<DateContext>
  var remained: ArraySlice<DateContext>
}
