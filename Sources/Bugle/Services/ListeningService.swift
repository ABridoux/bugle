//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

/// Start a `RunLoop` to listen to notifications
public final class ListeningService {

    var manager: ObserversManager?
    private static let current = ListeningService()

    public static func start(with manager: ObserversManager) {
        current.manager = manager
        RunLoop.current.run()
    }
}
