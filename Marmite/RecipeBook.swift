//
//  RecipeBook.swift
//  Marmite
//
//  Created by Ludovic Ollagnier on 17/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

class RecipeBook {

    static let instance = RecipeBook()

    private var recipes: Set<Recipe>

    private init() {
        recipes = []
    }

    var orderedRecipes: [Recipe] {
        return recipes.sorted { (r1, r2) -> Bool in
            return r1.name < r2.name
        }
    }

    var allRecipes: [Recipe] {
        return [Recipe](recipes)
    }

    func add(_ recipe: Recipe) {
        recipes.insert(recipe)
    }

    func remove(_ recipe: Recipe) -> Recipe? {
        return recipes.remove(recipe)
    }
}
