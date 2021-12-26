//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation

extension Array where Element == NotificationObserver {

    mutating func append(name: NSNotification.Name, using block: @escaping (Notification) -> Void) {
        append(NotificationObserver(for: name, block: block))
    }
}
