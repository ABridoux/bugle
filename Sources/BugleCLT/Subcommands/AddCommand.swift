//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation
import Bugle
import ArgumentParser

struct AddCommand: ParsableCommand {

    static let configuration = CommandConfiguration(commandName: "add", abstract: "Add an observation to a file")

    @Option(name: [.short], help: "The notification to observe")
    var name: String

    @Option(name: [.short], help: "The script path to add")
    var scriptPath: String

    @Option(name: [.short], help: "The observations file URL")
    var filePath: String

    func run() throws {
        try RegisteringService.addObserver(to: URL(fileURLWithPath: filePath), for: name, toExecuteScriptAt: scriptPath)
    }
}
