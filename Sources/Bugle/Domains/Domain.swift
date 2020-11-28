//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

public struct Domain: Decodable {

    // MARK: - Properties

    public let referenceURL: URL
    public let reverseDNS: String
    public let notifications: Set<NotficationRecord>

    // MARK: - Initialisation

    init(referenceURL: URL, reverseDNS: String, notifications: Set<NotficationRecord>) {
        self.referenceURL = referenceURL
        self.reverseDNS = reverseDNS
        self.notifications = notifications
    }

    public init?(domainName: String) {
        guard
            let domainRecord = DomainRecord.recordsList.first(where: { $0.name == domainName }),
            let data = try? Data(contentsOf: domainRecord.url),
            let domain = try? JSONDecoder().decode(Domain.self, from: data)
        else { return nil }

        self = domain
    }

    // MARK: - Functions

    public func notification(for name: String) throws -> String {
        guard notifications.map(\.name).contains(name) else {
            throw BugleError.unregisteredDomainNotification(domain: reverseDNS, notification: name)
        }
        return "\(reverseDNS).\(name)"
    }
}
