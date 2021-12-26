//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation

/// Functions to post notifications
public enum PostService {

    static var center = DistributedNotificationCenter.default

    public static func post(_ notificationName: NotificationName) {
        center.post(notificationName)
    }

    public static func post(_ notificationName: String) {
        center.post(.init(notificationName))
    }
}
