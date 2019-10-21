import XCTest
import CalendarUtilityTests

var tests = [XCTestCaseEntry]()
test += DateContextTests.allTests()
test += DateContextGeneratorTests.allTests()
test += SeparatorTests.allTests()
XCTMain(tests)
