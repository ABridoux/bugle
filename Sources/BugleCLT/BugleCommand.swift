//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation
import ArgumentParser

struct BugleCommand: ParsableCommand {

    static let configuration = CommandConfiguration(commandName: "bugle",
                                                    subcommands: [PostNotificationCommand.self,
                                                                  ListenCommand.self])
}
