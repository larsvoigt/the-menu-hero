//
//  MealController.swift
//  the menu hero
//
//  Created by Lars Voigt  on 14.12.17.
//  Copyright © 2017 Lars Voigt . All rights reserved.
//

import UIKit
import Foundation


class MealController: UITableViewController {

     var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = UIColor(red: 163/255, green: 179/255, blue: 158/255, alpha: 1.0)
        
//        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        return (category?.meals?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealCell
        cell.title.text = category?.meals![indexPath.row].title
        cell.subTitle.text = category?.meals![indexPath.row].subtitle
        cell.price.text = category?.meals![indexPath.row].price
        
        
        let layer = cell.layer
        layer.masksToBounds = true
        layer.cornerRadius = 8
        
//        cell.isAccessibilityElement = true
//        cell.label1.isAccessibiltyElement = false
//        cell.label2.isAccessibilityElement = false
//        cell.accessibilityLabel = NSLocalizedString(“@%@%”, cell.label1.text, cell.label2.text, comment:”Concatenated accessibility label text for cell”);
        
        return cell
    }
    

}
