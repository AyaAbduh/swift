//
//  ViewController.swift
//  movieAppWithNetwork
//
//  Created by Esraa Hassan on 5/8/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedMovie:Dictionary<String,Any>!

    @IBOutlet weak var movieTitle: UITextField!
    
    @IBOutlet weak var rating: UITextField!
    
    @IBOutlet weak var releaseYear: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        movieTitle.text=selectedMovie["title"] as! String
        rating.text=selectedMovie["rating"] as! String
        releaseYear.text=selectedMovie["releaseYear"] as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

