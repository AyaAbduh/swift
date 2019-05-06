//
//  AddMovieController.swift
//  movieApp
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import UIKit

class AddMovieController: UIViewController {
    var AddedMovie:movie!
     var AddMovievc:AddMovieProtocol?
    
    @IBOutlet weak var movieImage: UITextField!
    
    @IBOutlet weak var movieTitle: UITextField!
    
    @IBOutlet weak var movieRating: UITextField!
    
    @IBOutlet weak var movieGenre: UITextField!
    
    
    
    @IBOutlet weak var movieReleaseYear: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AddedMovie=movie()
        AddedMovie.image=movieImage.text
        AddedMovie.title=movieTitle.text
        AddedMovie.genre=[movieGenre.text] as? [String]
        AddedMovie.releaseYear=Int (movieReleaseYear.text!)
        AddedMovie.rating=Float(movieRating.text!)
    }
    
    @IBAction func AddBtn(_ sender: UIButton) {
        AddMovievc?.AddMovie(newMovie: AddedMovie)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
