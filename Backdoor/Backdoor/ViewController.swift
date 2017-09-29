//
//  ViewController.swift
//  Backdoor
//
//  Created by Alexander Lao on 4/27/17.
//  Copyright © 2017 Alexander Lao. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // the array to hold all the sneakers
    var masterSneakers: SneakerArray = SneakerArray()
    var boughtSneakers: SneakerArray = SneakerArray()
    var soldSneakers: SneakerArray = SneakerArray()
    var totalSpent: Double = 0.0
    var totalSold: Double = 0.0
    var profitMade: Double = 0.0
    
    @IBOutlet weak var spentLabel: UILabel!
    @IBOutlet weak var soldLabel: UILabel!
    @IBOutlet weak var profitLabel: UILabel!
    @IBOutlet weak var sneakerImageView: UIImageView!
    
    func calculateTotals()
    {
        // reset the variables to 0
        self.totalSpent = 0.0
        self.totalSold = 0.0
        self.profitMade = 0.0
        
        // loop through the bought sneaker array
        for sneaker in boughtSneakers.sneakers
        {
            // calculate the total amount spent
            if (sneaker.type == "bought")
            {
                self.totalSpent += (sneaker.priceBought * Double(sneaker.boughtQuantity))
            }
        }
        
        // loop through the sold sneaker array
        for sneaker in soldSneakers.sneakers
        {
            // calculate the total amount sold
            if (sneaker.type == "sold")
            {
                self.totalSold += (sneaker.priceSold * Double(sneaker.soldQuantity))
            }
        }
        
        // calculate the profit made
        self.profitMade = totalSold - totalSpent
        
        // update the labels
        let spent = String (format: "%.2f", self.totalSpent)
        let sold = String (format: "%.2f", self.totalSold)
        let profit = String (format: "%.2f", self.profitMade)
        
        self.spentLabel.text = "Total Spent: \(spent)"
        self.soldLabel.text = "Total Sold: \(sold)"
        self.profitLabel.text = "Total Profit: \(profit)"
        
        // update the profit text color
        if profitMade > 0
        {
            self.profitLabel.textColor = UIColor.green
        }
        else if profitMade < 0
        {
            self.profitLabel.textColor = UIColor.red
        }
        else
        {
            self.profitLabel.textColor = UIColor.white
        }
    }
    
    func chooseRandomSneakerImage()
    {
        if (!masterSneakers.sneakers.isEmpty)
        {
            // generate a random number
            let randomIndex = Int(arc4random_uniform(UInt32(self.masterSneakers.sneakers.count)))
            
            sneakerImageView.image = masterSneakers.sneakers[randomIndex].photo
        }
    }
    
    @IBAction func boughtTapped(_ sender: UIButton)
    {
        
    }
    
    @IBAction func soldTapped(_ sender: UIButton)
    {
        
    }
    
    @IBAction func viewCollectionTapped(_ sender: UIButton)
    {
        
    }
    
    @IBAction func scheduleTapped(_ sender: UIButton)
    {
        
    }
    
    // segue from the main view to the table view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "toViewCollection")
        {
            let tableVC = segue.destination as! CollectionTableViewController
            
            // pass the sneaker array from this view to the table view
            tableVC.tableSneakers = masterSneakers
        }
    }
    
    @IBAction func unwindFromBoughtSneaker (segue: UIStoryboardSegue)
    {
        let boughtVC = segue.source as! BoughtSneakerViewController
        if (boughtVC.newSneakerReady)
        {
            // retrieve the newSneaker from the bought view controller
            let newSneakerFromAdd = boughtVC.newSneaker
            
            // add the bought sneaker to the bought sneaker array
            self.boughtSneakers.sneakers.append(newSneakerFromAdd)
            
            // add the newSneaker to the master sneaker array
            self.masterSneakers.sneakers.append(newSneakerFromAdd)
        }
        
        // update the money labels after the unwind
        self.calculateTotals()
    }
    
    @IBAction func unwindFromSoldSneaker (segue: UIStoryboardSegue)
    {
        let soldVC = segue.source as! SoldSneakerViewController
        
        if (soldVC.soldSneakerReady)
        {
            // retrieve the soldSneaker from the sold view controller
            let soldSneaker = soldVC.soldSneaker
            let amount = soldSneaker.soldQuantity
            var i = 0
            
            // add the sold sneaker to the sold sneaker array
            self.soldSneakers.sneakers.append(soldSneaker)
        
            // loop through the master sneaker array
            for sneaker in masterSneakers.sneakers
            {
                // search by product number
                if (sneaker.productNumber == soldSneaker.productNumber)
                {
                    // decrement the amount sold from the array
                    sneaker.currentQuantity -= amount
                
                    // if the sneaker quantity is now 0, remove it from the array
                    if (sneaker.currentQuantity <= 0)
                    {
                        masterSneakers.sneakers.remove(at: i)
                        break
                    }
                }
            
                i += 1
            }
        }
        
        // update the money labels after the unwind
        self.calculateTotals()
    }
    
    @IBAction func unwindFromScheduleNotification (segue: UIStoryboardSegue)
    {
        
    }
    
    // programmatically set a gradient background
    // code from: http://stackoverflow.com/questions/24380535/
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
        // Do any additional setup after loading the view, typically from a nib.
        
        // set the gradient background
        self.setGradientBackground()
        
        // update the money labels each time the view loads
        self.calculateTotals()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        // choose and display a random sneaker image from the collection
        self.chooseRandomSneakerImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

