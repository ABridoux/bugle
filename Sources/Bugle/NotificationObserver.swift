//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

final class NotificationObserver {

    var name: Notification.Name
    var observer: NSObjectProtocol
    var center = DistributedNotificationCenter.default

    init(for name: Notification.Name, block: @escaping (Notification) -> Void) {
        self.name = name
        observer = center.addObserver(for: name, using: block)
    }

    deinit {
        center.removeObserver(observer, name: name)
    }
}
