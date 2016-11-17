//
//  Recipe.swift
//  Marmite
//
//  Created by Ludovic Ollagnier on 17/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

struct Recipe: Hashable {

    enum Kind: Int {
        case starter
        case main
        case desert
    }

    let type: Kind
    let name: String
    let numberOfPerson: Int
    let prepTime: Int
    let cookTime: Int
    let ingredients: [String]
    let steps: [String]

    var hashValue: Int {
        return "\(type.rawValue) \(name)".hashValue
    }

    static func ==(lhs: Recipe, rhs: Recipe) -> Bool {
        if lhs.type == rhs.type && lhs.name == rhs.name {
            return true
        }
        return false
    }
}
