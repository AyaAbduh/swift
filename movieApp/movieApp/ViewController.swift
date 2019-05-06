//
//  ViewController.swift
//  movieApp
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var selectedMovie:movie!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieRating: UILabel!
    
    @IBOutlet weak var movieReleaseYear: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectedMovie=movie()
        movieTitle.text=selectedMovie.title
      //  let rating=String(selectedMovie.rating)
        //movieRating.text=rating
        //movieReleaseYear.text=selectedMovie.releaseYear
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

