//
//  ScoreViewController.swift
//  quizApp
//
//  Created by Mustafa on 1.01.2022.
//

import UIKit
import CoreData

class ScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nameArray = [String]()
    var timeArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        getData()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    //MARK: - TableView methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.backgroundColor = UIColor(named: "backgroundColor")
        cell.textLabel?.text = "İsim: \(nameArray[indexPath.row]), Süre: \(timeArray[indexPath.row]) saniye."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    //MARK: - Get data
    func getData() {
        
        nameArray.removeAll()
        timeArray.removeAll()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HighScore")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                
                if let name = result.value(forKey: "name") as? String{
                    nameArray.append(name)
                }
                
                if let time = result.value(forKey: "time") as? String {
                    timeArray.append(time)
                }
            }
        } catch {
            print("Error occured while taking data from CoreData.")
        }
    }
}
