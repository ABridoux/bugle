//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

public typealias Observations = [String: [String]]

public enum RegisteringService {

    public static func loadObservers(from fileURL: URL) throws -> Observations {
        let data = try Data(contentsOf: fileURL)
        return try PropertyListDecoder().decode(Observations.self, from: data)
    }
}
