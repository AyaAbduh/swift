//
//  movieTableViewController.swift
//  movieAppWithNetwork
//
//  Created by Esraa Hassan on 5/8/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import UIKit
import CoreData

class movieTableViewController: UITableViewController {

    var output :Array<Dictionary<String,Any>>! //return array
    var movies = Array<NSManagedObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url=URL(string:"https://api.androidhive.info/json/movies.json")
        let request=URLRequest(url:url!)
        let session=URLSession(configuration: URLSessionConfiguration.default)
        _ = session.dataTask(with: request){
            (data,response,error) in
            
            do{
                 self.output=try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                var dic=self.output[0]
                print(self.output.count)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }catch{
                print("Error")
            }
            
        }.resume()
        
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
        return movies.count
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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell...
        var dict=self.output[indexPath.row]
        print(dict["title"])
        
        //coreData
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let ManagerContext=appDelegate.persistentContainer.viewContext     //NSMangedObjectContext
        let entity=NSEntityDescription.entity(forEntityName: "Movie", in: ManagerContext)
        let movie=NSManagedObject(entity: entity!, insertInto: ManagerContext)
        movie.setValue(dict["title"], forKey:"title")
        movie.setValue(dict["rating"], forKey:"rating")
        movie.setValue(dict["releaseYear"], forKey:"releaseYear")
        movie.setValue(dict["image"], forKey:"image")
        do{
            try ManagerContext.save()
            movies.append(movie)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
       // cell.textLabel?.text=dict["title"] as! String
        cell.textLabel?.text=movies[indexPath.row].value(forKey: "title") as! String
        self.tableView.reloadData()

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller:ViewController = storyboard.instantiateViewController(withIdentifier: "movieController") as! ViewController
        
       // controller.selectedMovie=movies[indexPath.row]
        
        self.navigationController?.pushViewController(controller, animated: false)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 50;
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
