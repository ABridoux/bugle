//
// Bugle
// Copyright (c) Alexis Bridoux 2020
// MIT license, see LICENSE file for details

import Bugle
import ArgumentParser

extension Domain: ExpressibleByArgument {

    public init?(argument: String) {
        self.init(domainName: argument)
    }
}
