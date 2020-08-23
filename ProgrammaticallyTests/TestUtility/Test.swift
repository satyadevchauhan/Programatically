//
//  Test.swift
//  ProgrammaticallyTests
//
//  Created by Satyadev Chauhan on 23/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import UIKit

private final class BundleToken {}

// Test data.
enum Test {
    
    static func url(forResource name: String, extension ext: String) -> URL {
        let bundle = Bundle(for: BundleToken.self)
        return bundle.url(forResource: name, withExtension: ext)!
    }
    
    static func data(name: String, extension ext: String) -> Data {
        let url = self.url(forResource: name, extension: ext)
        return try! Data(contentsOf: url)
    }
}
