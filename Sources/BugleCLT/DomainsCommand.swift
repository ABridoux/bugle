//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation
import Bugle
import ArgumentParser

struct DomainsCommand: ParsableCommand {

    // MARK: - Constants

    static let configuration = CommandConfiguration(commandName: "domains", abstract: "Domains informations")

    // MARK: - Properties

    @Argument(help: "Print the domain details", completion: .custom(listDomainNames))
    var domain: Domain?

    // MARK: - Functions

    func run() throws {
        if let domain = domain {
            print("[Reference]: \(domain.referenceURL.absoluteString)\n")
            domain.notifications.forEach { (notification) in
                print("❖ \(notification.name)")
                print("  \(notification.details)\n")
            }
        } else {
            Domain.allCases
                .lazy
                .map(\.name)
                .forEach { print($0) }
        }
    }
}
