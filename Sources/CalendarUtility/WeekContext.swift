public struct WeekContext {
  public let monthInfo: MonthInfo?
  public let days: [DateContext]
  public let weekOfMonth: Int

  public init(monthInfo: MonthInfo = .placeholder, days: [DateContext], weekOfMonth: Int = 0) {
    self.monthInfo = monthInfo
    self.days = days
    self.weekOfMonth = weekOfMonth
  }
}
