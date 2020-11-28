import XCTest
@testable import Bugle

final class DomainTests: XCTestCase {

    func testNotificationName() throws {
        let domain = Domain(referenceURL: URL(fileURLWithPath: ""), reverseDNS: "com.ducks", notifications: [.init(name: "Riri", details: "")])


        XCTAssertEqual(try domain.notification(for: "Riri"), "com.ducks.Riri")
    }

    func testNotificationNameThrowsIfUnregistered() throws {
        let domain = Domain(referenceURL: URL(fileURLWithPath: ""), reverseDNS: "com.ducks", notifications: [.init(name: "Riri", details: "")])

        XCTAssertThrowsError(try domain.notification(for: "Loulou"))
    }
}
