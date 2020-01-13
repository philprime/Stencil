//
//  Beam.swift
//  Beam
//
//  Created by Philip Niedertscheider on 10.01.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

import Foundation

public struct RegexMatchResult {

    internal let regex: NSRegularExpression
    internal let searchString: String
    internal let items: [NSTextCheckingResult]
    public let captures: [String]

    internal init(regex: NSRegularExpression, searchString: String, items: [NSTextCheckingResult]) {
        self.regex = regex
        self.searchString = searchString
        self.items = items

        captures = items
            .reduce([], { (prev, result) in
                return prev + (1..<result.numberOfRanges).map({ result.range(at: $0) })
            })
            .compactMap({ range -> String? in
                if range.lowerBound >= 0 && range.lowerBound <= searchString.count
                    && range.upperBound >= 0 && range.upperBound <= searchString.count {
                    return (searchString as NSString).substring(with: range)
                }
                return nil
            })
    }
}
