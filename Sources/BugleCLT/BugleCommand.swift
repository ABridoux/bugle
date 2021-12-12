//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Bugle
import ArgumentParser

struct BugleCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "bugle",
        abstract: "A tool to post and listen to distributed notifications to execute scripts",
        version: Version.current,
        subcommands: [
            PostNotificationCommand.self,
            ListenCommand.self,
            AddCommand.self,
            RemoveCommand.self,
            DomainsCommand.self,
            InstallCompletionScriptCommand.self
        ]
    )
}
