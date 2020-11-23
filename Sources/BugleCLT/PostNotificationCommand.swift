//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Bugle
import ArgumentParser

struct PostNotificationCommand: ParsableCommand {

    // MARK: - Contants

    static let configuration = CommandConfiguration(commandName: "post")

    // MARK: - Properties

    @Argument
    var notificationName: String

    func run() throws {
        PostService.post(notificationName)
    }
}
