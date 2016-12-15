//
//  RecipeTableViewController.swift
//  Marmite
//
//  Created by Ludovic Ollagnier on 15/12/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit

class RecipeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let r1 = Recipe(type: .starter, name: "Salade pas verte", numberOfPerson: 1, prepTime: 5, cookTime: 0, ingredients: ["Salade verte"], steps: ["Manger la salade"])
        RecipeBook.instance.add(r1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RecipeBook.instance.allRecipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)

        // Configure the cell...
        let recipe = RecipeBook.instance.allRecipes[indexPath.row]
        cell.textLabel?.text = recipe.name
        cell.detailTextLabel?.text = recipe.ingredients.first

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetails" {
            let destVC = segue.destination as! DetailsViewController
            destVC.test = "Youhou"
            
        }
    }
 

}
