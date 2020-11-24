//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation
import Bugle
import ArgumentParser

struct RemoveCommand: ParsableCommand {

    static let configuration = CommandConfiguration(commandName: "remove", abstract: "Remove an observation from a file")

    @Option(name: [.short], help: "The notification that is observed")
    var name: String

    @Option(name: [.short], help: "The script path to remove")
    var scriptPath: String

    @Option(name: [.short], help: "The observations file URL")
    var filePath: String

    func run() throws {
        try RegisteringService.removeObserver(from: URL(fileURLWithPath: filePath), for: name, andPath: scriptPath)
    }
}
