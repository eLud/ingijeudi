//
//  Recipe.swift
//  Marmite
//
//  Created by Ludovic Ollagnier on 17/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

struct Recipe {

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
}
