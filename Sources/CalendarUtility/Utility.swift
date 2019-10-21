import Foundation

func addZeroIfNeeded(_ int: Int) -> String {
  int < 10 ? "0" + String(int) : String(int)
}

let isNotZero: (Int) -> Bool = {
  $0 != 0
}

func createDate(calendar: Calendar = .current, year: Int, month: Int, day: Int) -> Date {
  DateComponents(calendar: calendar, year: year, month: month, day: day).date!
}

func calendarDayDisplayString(fromDay day: Int) -> String {
  day == 0 ? "  " : addZeroIfNeeded(day)
}

let isNotFake: (DateContext) -> Bool = {
  !$0.isPlaceholder
}

func applyWeekOfMonth(weeksCount: Int) -> ([WeekContext]) -> [WeekContext] {
  return { inputs in
    zip(1...weeksCount, inputs)
      .map { WeekContext(weekOfMonth: $0.0, days: $0.1.days) }
  }
}
