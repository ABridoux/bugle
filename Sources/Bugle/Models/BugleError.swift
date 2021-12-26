//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

struct BugleError: LocalizedError {

    var errorDescription: String?
}

extension BugleError {

    static func unregisteredDomainNotification(domain: String, notification: String) -> BugleError {
        BugleError(
            errorDescription: "Unregistered notification \(notification) for domain \(domain)"
        )
    }
}
