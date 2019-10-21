public struct WeekContext {
  public let weekOfMonth: Int
  public let days: [DateContext]
  
  internal init(days: [DateContext]) {
    self.weekOfMonth = 0
    self.days = days
  }
  
  public init(weekOfMonth: Int, days: [DateContext]) {
    self.weekOfMonth = weekOfMonth
    self.days = days
  }
}
