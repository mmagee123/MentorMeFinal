//
//  PeopleTableViewController.swift
//  TestCoreData3
//
//  Created by Robert Seitsinger on 2/25/17.
//  Copyright © 2017 cs378. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        self.changeBackground()
        super.viewDidLoad()
        
        // Set the nav bar title
        self.title = "Register"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var userNameTextField: UITextField? = nil
    var passwordTextField: UITextField? = nil
    var people = [NSManagedObject]()

    @IBAction func MentorSelected(_ sender: Any) {
        
       //Alert view asks for the mentor's username and password and stores it to core data
        let alert = UIAlertController(title: "New Mentor",
                                      message: "Register Yourself - THIS ALERT IS NOT READY TO TAKE IN INPUTS YET",
                                      preferredStyle: .alert)
        
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { (action: UIAlertAction!) -> Void in
                                        let userNameTextField = alert.textFields![0]
                                        let passwordTextField = alert.textFields![1]
                                        self.saveMentor(userName: userNameTextField.text!, password: passwordTextField.text!)
                                       // self.tableView.reloadData()  // causes the table data source methods to execute
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction!) -> Void in
        }

    
    
        alert.addTextField { (textField) -> Void in
            self.userNameTextField = textField
            self.userNameTextField?.placeholder = "User Name"
        }
        alert.addTextField { (textField) -> Void in
            self.passwordTextField = textField
            self.passwordTextField?.placeholder = "Password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
    
    }
    
    
    
    fileprivate func saveMentor(userName: String, password: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entity(forEntityName: "Mentor", in: managedContext)
        
        let mentor = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        // Set the attribute values
        mentor.setValue(userName, forKey: "User Name")
        mentor.setValue(password, forKey: "Password")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Add the new entity to our array of managed objects
        people.append(mentor)
    }

    
    fileprivate func loadData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Mentor")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            people = results
        } else {
            print("Could not fetch")
        }
    }

    
    @IBAction func MenteeSelected(_ sender: Any) {
        
        //Alert view asks for the mentor's username and password and stores it to core data
        let alert = UIAlertController(title: "New Mentee",
                                      message: "Register Yourself - THIS ALERT IS NOT READY TO TAKE IN INPUTS YET",
                                      preferredStyle: .alert)
        
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { (action: UIAlertAction!) -> Void in
                                        let userNameTextField = alert.textFields![0]
                                        let passwordTextField = alert.textFields![1]
                                        self.saveMentor(userName: userNameTextField.text!, password: passwordTextField.text!)
                                        // self.tableView.reloadData()  // causes the table data source methods to execute
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default) { (action: UIAlertAction!) -> Void in
        }
        
        
        
        alert.addTextField { (textField) -> Void in
            self.userNameTextField = textField
            self.userNameTextField?.placeholder = "User Name"
        }
        alert.addTextField { (textField) -> Void in
            self.passwordTextField = textField
            self.passwordTextField?.placeholder = "Password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
        
    }
    
    
    
    fileprivate func saveMentee(userName: String, password: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity =  NSEntityDescription.entity(forEntityName: "Mentee", in: managedContext)
        
        let mentee = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        // Set the attribute values
        mentee.setValue(userName, forKey: "User Name")
        mentee.setValue(password, forKey: "Password")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        // Add the new entity to our array of managed objects
        people.append(mentee)
    }
    
    fileprivate func loadData_() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Mentee")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            people = results
        } else {
            print("Could not fetch")
        }
    }
    
    
    public func changeBackground() {
        let defaults = UserDefaults.standard
        let bgColor = defaults.string(forKey: "backgroundColor")
        //Hexadecimal codes
        // Blue - #A2E8FF
        // Yellow - #FFF99B
        // Purple - #E9CCFF
        
        var colors : [String:UIColor] = ["#E9CCFF":UIColor(red:0.91, green:0.80, blue:1.00, alpha:1.0),"#FFF99B":UIColor(red:1.00, green:0.98, blue:0.61, alpha:1.0),"#A2E8FF": UIColor(red:0.64, green:0.91, blue:1.00, alpha:1.0)]
        
        if (bgColor != nil) {
            self.view.backgroundColor = colors[String(describing: bgColor!)]
            
        }
    }

}

    
    
    /*
    
 
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        // Get person object to display in table cell.
        let person = people[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = person.value(forKey: "name") as? String
        
        // Need to convert Int to String to be able to set to 'text' property.
        cell.detailTextLabel?.text = String((person.value(forKey: "age") as? Int)!)
        
        return cell
    }
    
 
    fileprivate func loadData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Person")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            people = results
        } else {
            print("Could not fetch")
        }
    }
    
} */


