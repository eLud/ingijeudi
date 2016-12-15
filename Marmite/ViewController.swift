//
//  ViewController.swift
//  Marmite
//
//  Created by Ludovic Ollagnier on 03/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

enum FormError: Error {
    case missingInfo(textField: UIView)

    func alert() {
        switch self {
        case .missingInfo(let textField):
            textField.backgroundColor = UIColor.red
        }
    }
}

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var recipedTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nbOfPersonTextField: UITextField!
    @IBOutlet weak var prepTimeTextField: UITextField!
    @IBOutlet weak var cookTimeTextField: UITextField!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var stepsTextView: UITextView!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Private methods

    private func recipeFromForm() throws -> Recipe {

        guard let nameString = nameTextField.text, !nameString.isEmpty else { throw FormError.missingInfo(textField: nameTextField) }
        guard let numberOfPString = nbOfPersonTextField.text, let numberOfPInt = Int(numberOfPString) else {
            throw FormError.missingInfo(textField: nbOfPersonTextField)
        }
        guard let prepString = prepTimeTextField.text, let prepInt = Int(prepString) else {
            throw FormError.missingInfo(textField: prepTimeTextField)
        }
        guard let cookTimeString = cookTimeTextField.text, let cookTimeInt = Int(cookTimeString) else {
            throw FormError.missingInfo(textField: cookTimeTextField)
        }
        guard let ingredients = ingredientsTextView.text else { throw FormError.missingInfo(textField: ingredientsTextView) }
        guard let steps = stepsTextView.text else { throw FormError.missingInfo(textField: stepsTextView) }
        guard let kind = Recipe.Kind(rawValue: recipedTypeSegmentedControl.selectedSegmentIndex) else { fatalError() }

        let stepsArray = steps.components(separatedBy: "\n")
        let ingredientsArray = ingredients.components(separatedBy: "\n")

        return Recipe(type: kind, name: nameString, numberOfPerson: numberOfPInt, prepTime: prepInt, cookTime: cookTimeInt, ingredients: ingredientsArray, steps: stepsArray)
    }

    //MARK: - Action
    @IBAction func save(_ sender: AnyObject) {
        do {
            let recipe = try recipeFromForm()
            RecipeBook.instance.add(recipe)
            dismiss(animated: true, completion: nil)
        } catch {
            print("Error")
        }
        print(RecipeBook.instance.allRecipes)
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        print("Cancel")
    }
}

