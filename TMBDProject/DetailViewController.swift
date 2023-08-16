//
//  DetailViewController.swift
//  TMBDProject
//
//  Created by Jae Oh on 2023/08/17.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var testLabel: UILabel!
    
    var testdata = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testLabel.text = String(testdata)
    }
    

   
}
