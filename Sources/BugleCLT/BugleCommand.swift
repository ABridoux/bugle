//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Bugle
import ArgumentParser

@main
struct BugleCommand: ParsableCommand {

    static let configuration = CommandConfiguration(
        commandName: "bugle",
        abstract: "A tool to post and listen to distributed notifications to execute scripts",
        version: BugleVersion.current,
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
