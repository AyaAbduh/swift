//
//  ViewController.swift
//  lab1
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var salaryTextView: UITextField!
    var Emp:Employees!
    var Mang:Managers!
    
    @IBOutlet weak var Result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Employee(_ sender: UIButton) {
        Emp = Employees()
        Result.text=Emp.getSalary(salary: salaryTextView.text!)
    }
    @IBAction func Manager(_ sender: UIButton) {
        Mang=Managers()
        Result.text=Mang.getSalary(salary: salaryTextView.text!)

    }
    
}

