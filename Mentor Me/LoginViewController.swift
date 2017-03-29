//
//  LoginViewController.swift
//  Mentor Me
//
//  Created by Meghan Magee on 3/23/17.
//  Copyright © 2017 Prarthana Neotia. All rights reserved.
//
//LLTODO - Make sure keyboard dismiss, btn dismiss, outside btn dismiss is everywhere ; limit "Back" when user goes from Home screen back to Login (and other places) ; put in alert controller ; review design ; uniform text fields w/gray text ; clear text fields when user goes back to this screen from Home screen

import CoreData
import UIKit

class LoginViewController: UIViewController {

//THIS IS FOR ADDING USERS TO CORE DATA FOR TESING - Please do not erase yet - LL////
    //properties
    var people = [NSManagedObject]()
    
//THIS IS FOR ADDING USERS TO CORE DATA FOR TESING - Please do not erase yet - LL////
    //properties
    var alertController: UIAlertController? = nil
    var delegate: UIViewController?
    
    //outlets
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        self.changeBackground()
        super.viewDidLoad()
        
//THIS IS FOR ADDING USERS TO CORE DATA FOR TESING - Please do not erase yet - LL////
        //add user
        savePerson(username: "mentor", password: "mentor123", accountType: 0)
        savePerson(username: "mentee", password: "mentee123", accountType: 1)
        
        // Load the people array - to get data previously stored.
        loadData()
//THIS IS FOR ADDING USERS TO CORE DATA FOR TESING - Please do not erase yet - LL////
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendToHomeScreen(_ sender: Any) { //LLTODO - Alert controller for errors
        
        //fetch declarations
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Entity")
        var fetchedResults: [NSManagedObject]? = nil
        var fetchedUsers: [NSManagedObject]? = nil

        //try to fetch - if no results, give error
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        //save fetch results - if no results, give error
        if let results = fetchedResults {
            fetchedUsers = results
        } else {
            print("Could not fetch - does not exist")
        }
        
        //loop through users to find matching username and password
        //LLTODO - Stop for loop when user is found ; try while loop and counter?
        //var foundUser: Bool = false
        var foundUserCount: Int32 = 0;
        
        for user in fetchedUsers! {
            if foundUserCount == 0 {
                let actualUsername: String = user.value(forKey: "username") as! String
                let actualPassword: String = user.value(forKey: "password") as! String
            
                if txtUsername.text == actualUsername && txtPassword.text == actualPassword { //check if both username and password stored in Core Data match given input
                    let accountTypeNumber: Int32 = user.value(forKey: "accountType") as! Int32
                
                    //reference: YouTube user The Swift Guy in the video "How to Trigger A Segue In xCode 8 (Swift 3.0)" - URL: https://www.youtube.com/watch?v=WfT-hJXuiys
                    //direct user to next screen based on account type
                    if accountTypeNumber == 0 { //go to Mentor Home screen
                        performSegue(withIdentifier: "sendToMentorHome", sender: self)
                    
                    } else { //go to Mentee Home screen
                        performSegue(withIdentifier: "sendToMenteeHome", sender: self)
                    }
                
                    //update foundUser variable
                    //foundUser = true
                    foundUserCount += 1
                    print(foundUserCount)
                
                } else {
                    ////implement alert to notify user of login error - still debugging
                    //self.alertController = UIAlertController(title: "Login Error", message: "Invalid login. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
                    //
                    //let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in print("OK Button Pressed")
                    //}
                    //
                    //self.alertController!.addAction(OKAction)
                    //
                    //present(self.alertController!, animated: true, completion: nil)
                
                    print("Incorrect username or password")
                }
            }
        }

        
// alternative code - still debugging
//        for user in fetchedUsers! {
//            let actualUsername: String = user.value(forKey: "username") as! String
//            let actualPassword: String = user.value(forKey: "password") as! String
//            
//            if txtUsername.text == actualUsername && txtPassword.text == actualPassword && foundUser == false { //check if both username and password stored in Core Data match given input
//                let accountTypeNumber: Int32 = user.value(forKey: "accountType") as! Int32
//                
//                //reference: YouTube user The Swift Guy in the video "How to Trigger A Segue In xCode 8 (Swift 3.0)" - URL: https://www.youtube.com/watch?v=WfT-hJXuiys
//                //direct user to next screen based on account type
//                if accountTypeNumber == 0 { //go to Mentor Home screen
//                    performSegue(withIdentifier: "sendToMentorHome", sender: self)
//                    
//                } else { //go to Mentee Home screen
//                    performSegue(withIdentifier: "sendToMenteeHome", sender: self)
//                }
//                
//                //update foundUser variable
//                foundUser = true
//                print(foundUser)
//
//            } else {
//                //implement alert to notify user of login error
//                self.alertController = UIAlertController(title: "Login Error", message: "Invalid login. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
//                
//                let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in print("OK Button Pressed")
//                }
//                
//                self.alertController!.addAction(OKAction)
//                
//                present(self.alertController!, animated: true, completion: nil)
//                
//                print("Incorrect username or password")
//            }
//        }
// alternative code - still debugging
    }

//THIS IS FOR ADDING USERS TO CORE DATA FOR TESING - Please do not erase yet - LL////
    fileprivate func loadData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Entity")
        
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
    
    //lindsey save person function -- for testing
    fileprivate func savePerson(username: String, password: String, accountType: Int32) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //create entity to save
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: managedContext)
        
        let user = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        //set attribute values
        user.setValue(username, forKey: "username")
        user.setValue(password, forKey: "password")
        user.setValue(accountType, forKey: "accountType")
        
        //commit changes
        do {
            try managedContext.save()
        } catch {
            //process error
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        //add new entity to array of managed objects
        people.append(user)
        print("User saved")
    }
//THIS IS FOR ADDING USERS TO CORE DATA FOR TESING - Please do not erase yet - LL////
    
     //reference: Users Rob and Yariv on stackoverflow.com - URL: http://stackoverflow.com/questions/28471164/how-to-set-back-button-text-in-swift
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Log Out"
        navigationItem.backBarButtonItem = backItem //will show in next VC
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
