//
//  CategoryUINavigationController.swift
//  the menu hero
//
//  Created by Lars Voigt  on 17.12.17.
//  Copyright © 2017 Lars Voigt . All rights reserved.
//
import UIKit

class CategoryUINavigationController: UINavigationController {
    
    @IBOutlet weak var navBar: UINavigationBar!
    var jsonData: Menu?
    let MENUS_PATH : String = "menus"
    
    override func viewDidLoad() {
        
        loadMenus(filename: MENUS_PATH)
        setRestaurantNameToNav()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadMenus(filename fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                jsonData = try decoder.decode(Menu.self, from: data)
                
                // print("Name : \(String(describing: jsonData))")
                //                let url = URL(string: "http://www.stackoverflow.com")
                //                let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                //                    let jsonDecoder = JSONDecoder()
                //                    let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data!)
                //
                //                }
                //                task.resume()
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    func setRestaurantNameToNav() {
        
        let tableVC = self.viewControllers.first as! CategoryController
        tableVC.jsonData = jsonData
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.text = jsonData?.restaurants![0].name
        label.accessibilityLabel = "Restaurant " + label.text! + " Kategorien"
        tableVC.navigationItem.titleView = label
        
        let back = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(backAction))
        back.tintColor = UIColor.white
        back.accessibilityLabel = "zurück zum Hauptmenü"
        tableVC.navigationItem.leftBarButtonItem = back

    }
    
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/
}
