//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import ArgumentParser
import Bugle

extension ParsableCommand {

    /// If the `domain` is not nil, try to produce the notification name prefixed by the domain reverse DNS
    func notification(for name: String, in domain: Domain?) throws -> String {
        var name = name
        if let domain = domain {
            name = try domain.notification(for: name)
        }
        return name
    }

    /// List all the registered domains
    static func listDomainNames(_ arguments: [String]) -> [String] {
        Domain.allCases.map(\.name)
    }

    /// Custom completion functions for domain notification names
    static func listDomainNotifications(_ arguments: [String]) -> [String] {
        guard
            let domainIndex = arguments.firstIndex(of: "-d") ?? arguments.firstIndex(of: "--domain"),
            arguments.count > domainIndex + 1,
            let domain = Domain(domainName: arguments[domainIndex + 1])
        else {
            return []
        }

        return domain.notifications.map(\.name)
    }
}
