//
//  DetailViewController.swift
//  Backdoor
//
//  Created by Alexander Lao on 5/2/17.
//  Copyright © 2017 Alexander Lao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    var sneakerImage: UIImage!
    var brandString: String!
    var nameString: String!
    var sizeString: String!
    var productNumberString: String!
    var retailPriceString: String!
    var pricePaidString: String!
    var quantityString: String!
    
    @IBOutlet weak var sneakerImageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var productNumberLabel: UILabel!
    @IBOutlet weak var retailPriceLabel: UILabel!
    @IBOutlet weak var pricePaidLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
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

        sneakerImageView.image = sneakerImage
        
        // update the detail labels
        self.brandLabel.text = "Brand: \(self.brandString!)"
        self.nameLabel.text = "Name: \(self.nameString!)"
        self.sizeLabel.text = "Size: \(self.sizeString!)"
        self.productNumberLabel.text = "Product Number: \(self.productNumberString!)"
        self.retailPriceLabel.text = "Retail Price: \(self.retailPriceString!)"
        self.pricePaidLabel.text = "Price Paid: \(self.pricePaidString!)"
        self.quantityLabel.text = "Quantity: \(self.quantityString!)"
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
