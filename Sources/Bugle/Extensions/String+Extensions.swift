//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

extension String {

    func removingJSONExtension() -> String {
        var copy = self
        if copy.hasSuffix(".json") {
            copy.removeLast(5)
        }
        return copy
    }
}
