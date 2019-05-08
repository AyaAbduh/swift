//
//  movieTableViewController.swift
//  movieApp
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import UIKit
import CoreData

class movieTableViewController: UITableViewController ,AddMovieProtocol{
    var movie1:movie!
    var movie2:movie!
    var movie3:movie!
    var movie4:movie!
    var movie5:movie!
    var Movie:movie!
    var movieList = [movie]()
    var movies = Array<NSManagedObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        movie1=movie()
        movie1.rating=9.0
        movie1.image="HomeAlone.jpg"
        movie1.releaseYear=2018
        movie1.title="Home Alone"
        movie1.genre?.append("Action")
        movie1.genre?.append("comidy")
        
        movie2=movie()
        movie2.rating=9.0
        movie2.image="HarryPotter.jpeg"
        movie2.releaseYear=2018
        movie2.title="harrypotter"
        movie2.genre?.append("Action")
        movie2.genre?.append("comidy")
        
        movie3=movie()
        movie3.rating=9.0
        movie3.image="NoteBook.jpeg"
        movie3.releaseYear=2018
        movie3.title="noteBook"
        movie3.genre?.append("Action")
        movie3.genre?.append("comidy")
        
        movie4=movie()
        movie4.rating=9.0
        movie4.releaseYear=2018
        movie4.image="Sam.jpg"
        movie4.title="I am SAM"
        movie4.genre?.append("Action")
        movie4.genre?.append("comidy")
        
        movie5=movie()
        movie5.rating=9.0
        movie5.image="spiderMan.jpeg"
        movie5.releaseYear=2018
        movie5.title="spiderMan"
        movie5.genre?.append("Action")
        movie5.genre?.append("comidy")
        
       // movieList.append(movie1)
       // movieList.append(movie2)
      //  movieList.append(movie3)
       // movieList.append(movie4)
      //  movieList.append(movie5)
       
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let appDelegate=UIApplication.shared.delegate as! AppDelegate
            let ManagerContext=appDelegate.persistentContainer.viewContext     //NSMangedObjectContext
            let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "Movie")
            do{
                movies=try ManagerContext.fetch(fetchRequest)
            }catch{
                print("Error")
            }
        }
    
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return movieList.count
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
       // cell.textLabel?.text=movieList[indexPath.row].title    //previous Lab
        cell.textLabel?.text=movies[indexPath.row].value(forKey: "title") as! String
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       
        let controller:ViewController = storyboard.instantiateViewController(withIdentifier: "movieController") as! ViewController
        
       // controller.selectedMovie=movieList[indexPath.row]    //previous lab
        controller.selectedMovie=movies[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: false)
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AddMovieVC=segue.destination as! AddMovieController
        AddMovieVC.AddMovievc=self
    }
    func AddMovie(newMovie: movie) {
        //movieList.append(newMovie)  //previous Lab
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let ManagerContext=appDelegate.persistentContainer.viewContext     //NSMangedObjectContext
        let entity=NSEntityDescription.entity(forEntityName: "Movie", in: ManagerContext)
        let movie=NSManagedObject(entity: entity!, insertInto: ManagerContext)
        movie.setValue(newMovie.title, forKey: "title")
        movie.setValue(newMovie.rating, forKey: "rating")
        movie.setValue(newMovie.releaseYear, forKey: "releaseYear")
        movie.setValue(newMovie.image, forKey: "image")
        do{
            try ManagerContext.save()
            movies.append(movie)
            self.tableView.reloadData()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
         self.tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
