//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

extension NotificationCenter {

    func post(_ notificationName: NSNotification.Name) {
        post(name: notificationName, object: nil)
    }

    func addObserver(for notificationName: NSNotification.Name, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        addObserver(forName: notificationName, object: nil, queue: nil, using: block)
    }

    func removeObserver(_ observer: NSObjectProtocol, name: NSNotification.Name) {
        removeObserver(observer, name: name, object: nil)
    }
}
