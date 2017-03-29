//
//  SettingsViewController.swift
//  Mentor Me
//
//  Created by Meghan Magee on 3/23/17.
//  Copyright © 2017 Prarthana Neotia. All rights reserved.
//


import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var transitionControl: UISegmentedControl!

    
    var transitionOption : String = "scrollClicked"
    var currentTwoOption = 0

    override func viewDidLoad() {
        self.changeBackground()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let defaults = UserDefaults.standard
    
    @IBAction func blueButtonClicked(_ sender: Any) {
        defaults.set("#A2E8FF", forKey: "backgroundColor")
        self.changeBackground()
    }
    
    @IBAction func yellowButtonClicked(_ sender: Any) {
        defaults.set("#FFF99B", forKey: "backgroundColor")
        self.changeBackground()
    }
    
    @IBAction func purpleButtonClicked(_ sender: Any) {
        defaults.set("#E9CCFF", forKey: "backgroundColor")
        self.changeBackground()
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        print(transitionOption)
        defaults.set(transitionOption, forKey: "transitionStyle")
        //TODO: go back to where they came from
        
    }
    
    @IBAction func transitionStyleChanged(_ sender: Any) {
        self.currentTwoOption = self.transitionControl.selectedSegmentIndex
        self.setTwoOptionsLabelText()
    }
    
    // Set the label text for the label that is under the two-button segmented control.
    func setTwoOptionsLabelText() {
        switch self.transitionControl.selectedSegmentIndex
        {
        case 0:
            self.transitionOption = "scrollClicked"
        case 1:
            self.transitionOption = "pageCurlClicked"
        default:
            break
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
