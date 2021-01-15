import XCTest
import Flurry_iOS_SDK

@testable import Analytically

class AnalyticsTests: XCTestCase {
    var services: AnalyticsService!
    let provider = MockProvider()
    override func setUp() {
        super.setUp()
        services = AnalyticsService(providers: [provider])
    }
    func testRegisterProvider() {
        let provider2 = MockProvider()
        services.register(provider: provider2)
        services.log(event: MockEvents.test)
        XCTAssertTrue(provider.logEventCalled)
        XCTAssertTrue(provider2.logEventCalled)
    }
    func testLogEvent() {
        services.log(event: MockEvents.test)
        XCTAssertTrue(provider.logEventCalled)
        XCTAssertFalse(provider.logErrorCalled)
    }
    
    func testLogError() {
        services.error(Caught(errorId: "error", message: "", error: NSError()))
        XCTAssertFalse(provider.logEventCalled)
        XCTAssertTrue(provider.logErrorCalled)
    }
    
}

enum MockEvents: Eventable {
    case test
    var name: String {
        return "test"
    }
    
    var parameters: [String : Any] {
        return ["ACTION": 1]
    }
    
    
}
class MockProvider: AnalyticsProvider {
    var logEventCalled = false
    var logErrorCalled = false
    func logEvent(name: String, parameters: [String : Any]) {
        logEventCalled = true
    }
    
    func logError(errorId: String, message: String, error: Error) {
        logErrorCalled = true
    }
    
}
