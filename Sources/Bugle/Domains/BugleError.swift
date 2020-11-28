//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

enum BugleError: LocalizedError {

    case unregisteredDomainNotification(domain: String, notification: String)

    var errorDescription: String? {
        switch self {
        case .unregisteredDomainNotification(let domain, let notification): return "Unregistered notification \(notification) for domain \(domain)"
        }
    }
}
