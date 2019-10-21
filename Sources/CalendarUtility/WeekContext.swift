public struct WeekContext {
  public let monthInfo: MonthInfo?
  public let days: [DateContext]

  public init(monthInfo: MonthInfo? = nil, days: [DateContext]) {
    self.monthInfo = monthInfo
    self.days = days
  }
}
