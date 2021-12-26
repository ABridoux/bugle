//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

public struct Domain {

    public let name: String
    public let referenceURL: URL
    public let reverseDNS: String
    public let notifications: Set<NotificationRecord>
}

// MARK: - Init

extension Domain {

    public init?(domainName: String) {
        if let domain = Self.allCases.first(where: { domainName == $0.name }) {
            self = domain
        } else {
            return nil
        }
    }
}

// MARK: - Functions

extension Domain {

    public func notification(for name: String) throws -> String {
        guard notifications.map(\.name).contains(name) else {
            throw BugleError.unregisteredDomainNotification(domain: reverseDNS, notification: name)
        }
        return "\(reverseDNS).\(name)"
    }
}
