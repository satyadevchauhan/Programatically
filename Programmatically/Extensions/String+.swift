//
//  String+.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 22/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import Foundation

extension String {
    
    /// Localized value of String
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// Localized value of String
    ///
    /// - Parameters:
    ///   - comment: comment for localized String.
    func localized(_ comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
