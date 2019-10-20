import XCTest
import CalendarUtilityTests

var tests = [XCTestCaseEntry]()
test += DateContextTests.allTests()
test += DateContextGeneratorTests.allTests()
test += DateContextSeparatorTests.allTests()
XCTMain(tests)
