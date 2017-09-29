//
//  CollectionTableViewController.swift
//  Backdoor
//
//  Created by Alexander Lao on 4/27/17.
//  Copyright © 2017 Alexander Lao. All rights reserved.
//

import UIKit

class CollectionTableViewController: UITableViewController
{
    // array of sneakers
    var tableSneakers: SneakerArray = SneakerArray()
    var selectedRow = 0
    
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return tableSneakers.sneakers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // display the brand and name
        cell.textLabel?.text = tableSneakers.sneakers[indexPath.row].brand + " " + tableSneakers.sneakers[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.selectedRow = indexPath.row
        performSegue(withIdentifier: "toDetail", sender: nil)
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            // Delete the row from the data source
            tableSneakers.sneakers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert
        {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "toDetail")
        {
            let detailVC = segue.destination as! DetailViewController
            
            // pass the selected sneaker's data to the detail view
            detailVC.sneakerImage = tableSneakers.sneakers[self.selectedRow].photo
            detailVC.brandString = tableSneakers.sneakers[self.selectedRow].brand
            detailVC.nameString = tableSneakers.sneakers[self.selectedRow].name
            detailVC.sizeString = tableSneakers.sneakers[self.selectedRow].size
            detailVC.productNumberString = tableSneakers.sneakers[self.selectedRow].productNumber
            detailVC.retailPriceString = tableSneakers.sneakers[self.selectedRow].price
            
            if (tableSneakers.sneakers[self.selectedRow].type == "bought")
            {
                detailVC.pricePaidString = String(format: "%.2f", tableSneakers.sneakers[self.selectedRow].priceBought)
            }
            else
            {
                detailVC.pricePaidString = "N/A"
            }
            
            detailVC.quantityString = String(format: "%d", tableSneakers.sneakers[self.selectedRow].currentQuantity)
        }
    }
 
    
    @IBAction func unwindFromAddSneaker (segue: UIStoryboardSegue)
    {
        let addVC = segue.source as! AddSneakerViewController
        if (addVC.newSneakerReady)
        {
            let newSneakerFromAdd = addVC.newSneaker
            tableSneakers.sneakers.append(newSneakerFromAdd)
            self.tableView.reloadData()
        }
    }
}
