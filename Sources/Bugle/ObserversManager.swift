//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

public typealias NotificationName = NSNotification.Name

public struct ObserversManager {

    var observers = [NotificationObserver]()

    public init() {}
    
    mutating public func addObserver(name: NotificationName, for block: @escaping (Notification) -> Void) {
        observers.append(name: name, using: block)
    }

    mutating public func addObserver(name: String, for scriptPath: String) {
        observers.append(name: .init(name)) { _ in
            print("❖ Received \(name) - Launched script at '\(scriptPath)'")
            ExecutionService.executeScript(at: scriptPath)
        }
    }

    mutating public func add(observations: Observations) {
        observations.forEach { registerScriptTasks(for: $0.key, scriptPaths: $0.value) }
    }

    mutating public func registerScriptTasks(for notificationName: String, scriptPaths: [String]) {
        scriptPaths.forEach { (path) in
            addObserver(name: notificationName, for: path)
        }
    }
}

enum ExecutionService {

    static func executeScript(at scriptPath: String) {
        let url = URL(fileURLWithPath: scriptPath)
        do {
            let task = try NSUserScriptTask(url: url)
            task.execute { error in
                if let error = error {
                    print("✖︎ The script at \(scriptPath) finished with an error: \(error), \(error.localizedDescription)\n")
                } else {
                    print("✓ The script at \(scriptPath) finished successfully\n")
                }
            }
        } catch {
            print("✖︎ Error while loading the script at \(scriptPath). \(error), \(error.localizedDescription)\n")
        }
    }
}
