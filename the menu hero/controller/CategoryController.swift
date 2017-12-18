//
//  TableViewControllerMenu.swift
//  the menu hero
//
//  Created by Lars Voigt  on 12.12.17.
//  Copyright © 2017 Lars Voigt . All rights reserved.
//

import UIKit

class CategoryController: UITableViewController {
    
    var jsonData: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor(red: 163/255, green: 179/255, blue: 158/255, alpha: 1.0)
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (jsonData?.restaurants![0].category!.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryCell
        cell.textLabel!.text = jsonData?.restaurants![0].category![indexPath.row].title
        cell.accessibilityLabel = cell.textLabel!.text
        cell.textLabel?.textAlignment = .center
        let layer = cell.layer
        layer.masksToBounds = true
        layer.cornerRadius = 8
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMeals" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! MealController
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.category = jsonData?.restaurants![0].category![indexPath.row]
                
                let backItem = UIBarButtonItem()
                backItem.title = "Kategorie"
                backItem.tintColor = UIColor.black
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
}
