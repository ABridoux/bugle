//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation

/// Functions to execute a script at a path
enum ScriptExecutionService {

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
