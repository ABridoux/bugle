//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation

/// Hold an array of `NotificationObserver`s with logic to manage it
public struct ObserversManager {

    var observers = [NotificationObserver]()

    public init() {}

    mutating public func addObserver(name: NotificationName, for block: @escaping (Notification) -> Void) {
        observers.append(name: name, using: block)
    }

    mutating public func addObserver(name: String, for scriptPath: String) {
        observers.append(name: .init(name)) { _ in
            print("❖ Received \(name) - Launched script at '\(scriptPath)'")
            ScriptExecutionService.executeScript(at: scriptPath)
        }
    }

    mutating public func add(observations: Observations) {
        observations.forEach { registerScriptTasks(for: $0.key, scriptPaths: $0.value) }
    }

    mutating public func registerScriptTasks(for notificationName: String, scriptPaths: [String]) {
        scriptPaths.forEach { addObserver(name: notificationName, for: $0) }
    }
}
