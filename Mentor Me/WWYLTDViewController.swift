//
//  WWYLTDViewController.swift
//  Mentor Me
//
//  Created by Meghan Magee on 3/23/17.
//  Copyright © 2017 Prarthana Neotia. All rights reserved.
//

import UIKit

class WWYLTDViewController: UIViewController {

    override func viewDidLoad() {
        self.changeBackground()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
