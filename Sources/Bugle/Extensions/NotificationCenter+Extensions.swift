//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

public typealias NotificationName = NSNotification.Name

extension NotificationCenter {

    func post(_ notificationName: NotificationName) {
        post(name: notificationName, object: nil)
    }

    func addObserver(for notificationName: NotificationName, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        addObserver(forName: notificationName, object: nil, queue: nil, using: block)
    }

    func removeObserver(_ observer: NSObjectProtocol, name: NotificationName) {
        removeObserver(observer, name: name, object: nil)
    }
}
