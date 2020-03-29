//
//  Beam.swift
//  Beam
//
//  Created by Philip Niedertscheider on 10.01.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

public func ~= (regex: Regex, value: String) -> RegexMatchResult? {
    let match = regex.match(in: value)
    return match.items.isEmpty ? nil : match
}
