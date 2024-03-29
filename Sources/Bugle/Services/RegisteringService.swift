//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation

public typealias Observations = [String: [String]]

/// Functions to add and remove observations to/from a Plist file
public enum RegisteringService {

    public static func loadObservers(from fileURL: URL) throws -> Observations {
        if try createNewFile(at: fileURL) {
            return Observations()
        } else {
            let data = try Data(contentsOf: fileURL)
            return try PropertyListDecoder().decode(Observations.self, from: data)
        }
    }

    static func store(_ observations: Observations, to fileURL: URL) throws {
        let data = try PropertyListEncoder().encode(observations)
        try data.write(to: fileURL)
    }

    public static func addObserver(to fileURL: URL, for notificationName: String, toExecuteScriptAt scriptPath: String) throws {
        var observations = try loadObservers(from: fileURL)
        observations[notificationName, default: []].append(scriptPath)
        try store(observations, to: fileURL)
    }

    public static func removeObserver(from fileURL: URL, for notificationName: String, andPath scriptPath: String) throws {
        var observations = try loadObservers(from: fileURL)

        guard
            var paths = observations[notificationName],
            let index = paths.firstIndex(of: scriptPath)
        else { return }

        paths.remove(at: index)

        if !paths.isEmpty {
            observations[notificationName] = paths
        } else {
            observations.removeValue(forKey: notificationName)
        }

        try store(observations, to: fileURL)
    }

    /// Create a file at the given url if no file exits
    /// - Returns: `true` if a file was created
    static func createNewFile(at url: URL) throws -> Bool {
        let fileManager = FileManager.default
        guard !fileManager.fileExists(atPath: url.path) else { return false }

        fileManager.createFile(atPath: url.path, contents: nil)
        return true
    }
}
