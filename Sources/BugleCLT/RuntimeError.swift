//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation

enum RuntimeError: LocalizedError {
    case completionScriptInstallation(description: String)

    var errorDescription: String? {
        switch self {
        case .completionScriptInstallation(let description): return "Error while installating the completion script. \(description)"
        }
    }
}
