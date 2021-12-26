//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation
import Bugle
import ArgumentParser

struct RemoveCommand: ParsableCommand {

    // MARK: - Functions

    static let configuration = CommandConfiguration(commandName: "remove", abstract: "Remove an observation from a file")

    // MARK: - Properties

    @Option(name: [.short, .long], help: "A specific domain holding the reverse DNS of the notification", completion: .custom(listDomainNames))
    var domain: Domain?

    @Option(name: [.short], help: "The notification that is observed", completion: .custom(listDomainNotifications))
    var notificationName: String

    @Option(name: [.short], help: "The script path to remove", completion: .file())
    var scriptPath: String

    @Option(name: [.short], help: "The observations file URL", completion: .file())
    var filePath: String

    // MARK: - Functions

    func run() throws {
        let name = try notification(for: notificationName, in: domain)
        try RegisteringService.removeObserver(from: URL(fileURLWithPath: filePath), for: name, andPath: scriptPath)
    }
}
