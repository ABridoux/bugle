//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Bugle
import ArgumentParser

struct PostNotificationCommand: ParsableCommand {

    // MARK: - Contants

    static let configuration = CommandConfiguration(commandName: "post", abstract: "Post a distributed notification")

    // MARK: - Properties

    @Option(name: [.short, .long], help: "A specific domain to register the  notification", completion: .custom(listDomainNames))
    var domain: Domain?

    @Option(name: [.short], help: "The notification to observe", completion: .custom(listDomainNotifications))
    var notificationName: String

    // MARK: - Functions

    func run() throws {
        let name = try notification(for: notificationName, in: domain)
        PostService.post(name)
    }
}
