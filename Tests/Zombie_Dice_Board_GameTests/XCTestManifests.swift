import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Zombie_Dice_Board_GameTests.allTests),
    ]
}
#endif
