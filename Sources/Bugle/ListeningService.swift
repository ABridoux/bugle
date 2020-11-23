//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

public final class ListeningService {

    var manager: ObserversManager?
    static let shared = ListeningService()

    deinit {
        print("Listen deinit")
    }

    public static func start(with manager: ObserversManager) {
        shared.manager = manager
        RunLoop.current.run()
    }
}
