//
//  ViewController.swift
//  the menu hero
//
//  Created by Lars Voigt  on 11.12.17.
//  Copyright © 2017 Lars Voigt . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgMenu: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imgMenu.layer.borderWidth = 6;
        self.imgMenu.layer.borderColor = UIColor.white.cgColor; self.navigationController?.navigationBar.barStyle = UIBarStyle.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

