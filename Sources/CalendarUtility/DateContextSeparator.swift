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
