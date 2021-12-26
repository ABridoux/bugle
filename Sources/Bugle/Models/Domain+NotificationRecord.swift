//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

extension Domain {

    /// A notification in a specific domain that can be sent or received
    public struct Notification: Hashable {
        public let name: String
        public let details: String
    }
}
