import XCTest
@testable import Bugle

final class DomainTests: XCTestCase {

    func testNotificationName() throws {
        let domain = Domain(name: "ducks", reverseDNS: "com.ducks", notificationNames: ["Riri"])

        XCTAssertEqual(try domain.notification(for: "Riri"), "com.ducks.Riri")
    }

    func testNotificationNameThrowsIfUnregistered() throws {
        let domain = Domain(name: "ducks", reverseDNS: "com.ducks", notificationNames: ["Riri"])

        XCTAssertThrowsError(try domain.notification(for: "Loulou"))
    }
}
