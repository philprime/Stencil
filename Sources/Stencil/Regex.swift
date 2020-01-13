//
//  Beam.swift
//  Beam
//
//  Created by Philip Niedertscheider on 10.01.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

import Foundation

public struct Regex {

    private let pattern: String
    private let regex: NSRegularExpression

    public init(pattern: String) throws {
        self.pattern = pattern

        regex = try NSRegularExpression(pattern: pattern, options: [])
    }

    public func match(in value: String) -> RegexMatchResult {
        var matches: [NSTextCheckingResult] = []
        let range = NSRange(location: 0, length: value.count)

        regex.enumerateMatches(in: value, options: [], range: range) { (result, _, _) in
            if let result = result {
                matches.append(result)
            }
        }

        return RegexMatchResult(regex: regex, searchString: value, items: matches)
    }
}
