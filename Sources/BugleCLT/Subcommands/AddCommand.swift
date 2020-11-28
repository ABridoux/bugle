//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation
import Bugle
import ArgumentParser

private let discussion =
"""
Create the file if it does not exist at the path.
"""

struct AddCommand: ParsableCommand {

    // MARK: - Constants

    static let configuration = CommandConfiguration(commandName: "add", abstract: "Add an observation to a file", discussion: discussion)

    // MARK: - Properties

    @Option(name: [.short, .long], help: "A specific domain holding the reverse DNS of the notification", completion: .custom(listDomainNames))
    var domain: Domain?

    @Option(name: [.short], help: "The notification to observe", completion: .custom(listDomainNotifications))
    var notificationName: String

    @Option(name: [.short], help: "The script path to add", completion: .file())
    var scriptPath: String

    @Option(name: [.short], help: "The observations file path", completion: .file())
    var filePath: String

    // MARK: - Functions

    func run() throws {
        let name = try notification(for: notificationName, in: domain)
        try RegisteringService.addObserver(to: URL(fileURLWithPath: filePath), for: name, toExecuteScriptAt: scriptPath)
    }
}
