//
//  ViewController.swift
//  Marmite
//
//  Created by Ludovic Ollagnier on 03/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

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

    //MARK: - Action
    @IBAction func save(_ sender: AnyObject) {
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
    }
}

