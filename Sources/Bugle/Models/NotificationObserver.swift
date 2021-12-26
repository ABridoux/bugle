//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation

/// Handle the logic to add and remove an observer to/from the `DistributedNotificationCenter`
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
