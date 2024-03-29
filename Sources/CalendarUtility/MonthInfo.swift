public struct MonthInfo: Equatable {
  public let name: String
  public let weeksCount: Int
  
  public static let placeholder = MonthInfo(name: "", weeksCount: 0)
}
