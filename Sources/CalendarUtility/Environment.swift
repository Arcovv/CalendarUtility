import Foundation

struct Environment {
  var calendar: Calendar
  var timezone: TimeZone
}

var Current = Environment(
  calendar: .current,
  timezone: .current
)
