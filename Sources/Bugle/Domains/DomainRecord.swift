//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Foundation

public struct DomainRecord {
    public let name: String
    public let url: URL

    public static let recordsList: [DomainRecord] = {
        guard let url = Bundle.module.url(forResource: "DomainRecords", withExtension: nil) else {
            assertionFailure("Unable to get the domains 'Records' folder url in the Bundle")
            return []
        }

        do {
            return try FileManager.default.contentsOfDirectory(atPath: url.path).map { (recordName) in
                let fileURL = url.appendingPathComponent(recordName)
                return DomainRecord(name: recordName.removingJSONExtension(), url: fileURL)
            }
        } catch {
            assertionFailure("Unable to list the domains records in the 'Records' folder")
            return []
        }
    }()
}
