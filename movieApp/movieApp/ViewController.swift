//
//  ViewController.swift
//  movieApp
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    
     //var selectedMovie:movie!
        var selectedMovie:NSManagedObject!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieReleaseYear: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        movieTitle.text=selectedMovie.title
//        let rating = selectedMovie.rating!
//        movieRating.text=String(rating)
//        let releaseyear=selectedMovie.releaseYear!
//        movieReleaseYear.text=String(releaseyear)
//        movieImage.image=UIImage(named: selectedMovie.image!)
//        //selectedMovie.genre[0]
        
        movieTitle.text=selectedMovie.value(forKey: "title") as! String
      //  movieRating.text=selectedMovie.value(forKey: "rating") as! String
       // movieReleaseYear.text=selectedMovie.value(forKey: "releaseYear") as! String
        movieImage.image=UIImage(named: selectedMovie.value(forKey: "image") as! String)
            //selectedMovie.genre[0]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

