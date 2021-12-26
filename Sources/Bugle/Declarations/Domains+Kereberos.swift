//
// Bugle
// Copyright (c) Alexis Bridoux 2020-present
// MIT license, see LICENSE file for details

import Foundation

extension Domain {

    public static let kerberos = Domain(
        name: "kerberos",
        referenceURL: URL(string: "https://www.apple.com/business/docs/site/Kerberos_Single_Sign_on_Extension_User_Guide.pdf")!,
        reverseDNS: "com.apple.KerberosPlugin",
        notifications: [
            Notification(
                name: "ConnectionCompleted",
                details: "The Kerberos SSO extension has run its connection process."
            ),
            Notification(
                name: "ADPasswordChanged",
                details: "The user has changed the Active Directory password with the extension"
            ),
            Notification(
                name: "LocalPasswordSynced",
                details: "The user has brought the Active Directory and local passwords in sync."
            ),
            Notification(
                name: "InternalNetworkAvailable",
                details: "The user has connected to a network where the configured Active Directory domain is available."),
            Notification(
                name: "InternalNetworkNotAvailable",
                details: "The user has connected to a network where the configured Active Directory domain is not available."
            ),
            Notification(
                name: "gotNewCredential",
                details: "The user has acquired a new Kerberos TGT."
            ),
            Notification(
                name: "passwordChangedWithPasswordSync",
                details: "The user has changed the Active Directory password, and the local password has been updated to match the new Active Directory password."
            )
        ]
    )
}
