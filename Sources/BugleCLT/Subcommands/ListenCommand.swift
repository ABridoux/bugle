//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation
import Bugle
import ArgumentParser

struct ListenCommand: ParsableCommand {

    // MARK: - Constants

    static let configuration = CommandConfiguration(commandName: "listen", abstract: "Start listening the observations in the observations file")

    // MARK: - Properties

    @Option(name: [.short], help: "The observations file URL", completion: .file())
    var filePath: String

    // MARK: - Functions

    func run() throws {
        let observations = try RegisteringService.loadObservers(from: URL(fileURLWithPath: filePath))
        var manager = ObserversManager()
        manager.add(observations: observations)

        print("Start listening for observations at '\(filePath)'")
        ListeningService.start(with: manager)
    }
}
