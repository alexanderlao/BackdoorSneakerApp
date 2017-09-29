//
//  ScheduleNotificationViewController.swift
//  Backdoor
//
//  Created by Alexander Lao on 5/1/17.
//  Copyright © 2017 Alexander Lao. All rights reserved.
//

import UIKit

class ScheduleNotificationViewController: UIViewController
{

    @IBAction func cancelTapped(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "unwindFromScheduleNotification", sender: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "unwindFromScheduleNotification", sender: nil)
    }
    
    func setGradientBackground()
    {
        let colorTop =  UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 175.0/255.0, green: 175.0/255.0, blue: 175.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.setGradientBackground()

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

}
