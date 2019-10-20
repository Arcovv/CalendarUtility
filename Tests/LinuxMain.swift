import XCTest
import CalendarUtilityTests

var tests = [XCTestCaseEntry]()
test += DateContextTests.allTests()
test += DateContextGeneratorTests.allTests()
XCTMain(tests)
