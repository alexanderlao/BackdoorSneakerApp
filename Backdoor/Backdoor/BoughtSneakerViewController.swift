//
//  BoughtSneakerViewController.swift
//  Backdoor
//
//  Created by Alexander Lao on 4/28/17.
//  Copyright © 2017 Alexander Lao. All rights reserved.
//

import UIKit
import MobileCoreServices

class BoughtSneakerViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var sneakerNameTextField: UITextField!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var productNumberTextField: UITextField!
    @IBOutlet weak var retailPriceTextField: UITextField!
    @IBOutlet weak var pricePaidTextField: UITextField!
    @IBOutlet weak var dateBoughtTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var sneakerImageView: UIImageView!
    
    // sneaker variable to hold the new sneaker
    var newSneaker: Sneaker = Sneaker()
    
    // lets the segue from the main view know if the new sneaker is ready
    var newSneakerReady: Bool = false
    
    var selectedImage: UIImage!
    
    @IBAction func addImageTapped(_ sender: UIButton)
    {
        self.selectImage()
        
    }
    
    func selectImage ()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = false
            picker.sourceType = .photoLibrary // or see below
            picker.mediaTypes = [kUTTypeImage as String]
            self.present(picker, animated: true, completion: nil)
        }
        else
        {
            print("Photo library not available!")
        }
    }
    
    // UIImagePickerControllerDelegate methods
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any])
    {
        self.selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.sneakerImageView.image = self.selectedImage // contentMode = .scaleAspectFit
        self.newSneaker.photo = self.sneakerImageView.image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem)
    {
        performSegue(withIdentifier: "unwindFromBoughtSneaker", sender: nil)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem)
    {
        self.updateAllTextFields()
        self.newSneakerReady = true
        performSegue(withIdentifier: "unwindFromBoughtSneaker", sender: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // hide the keyboard
        self.view.endEditing (true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        self.updateAllTextFields()
    }
    
    func updateAllTextFields()
    {
        // update the newSneaker's fields to its respective textField
        self.newSneaker.brand = brandTextField.text!
        self.newSneaker.name = sneakerNameTextField.text!
        self.newSneaker.size = sizeTextField.text!
        self.newSneaker.productNumber = productNumberTextField.text!
        self.newSneaker.price = retailPriceTextField.text!
        self.newSneaker.dateBought = dateBoughtTextField.text!
        self.newSneaker.type = "bought"
        
        // make sure the text field isn't empty before we try to unwrap
        if (pricePaidTextField.text != "")
        {
            // this will crash the app if the text isn't an integer
            self.newSneaker.priceBought = (Double(pricePaidTextField.text!))!
        }
        
        // make sure the text field isn't empty before we try to unwrap
        if (quantityTextField.text != "")
        {
            // this will crash the app if the text isn't an integer
            self.newSneaker.boughtQuantity = (Int(quantityTextField.text!))!
            self.newSneaker.currentQuantity = (Int(quantityTextField.text!))!
        }
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

        // set each of the text field's delegates to self
        self.brandTextField.delegate = self
        self.sneakerNameTextField.delegate = self
        self.sizeTextField.delegate = self
        self.productNumberTextField.delegate = self
        self.retailPriceTextField.delegate = self
        self.pricePaidTextField.delegate = self
        self.dateBoughtTextField.delegate = self
        self.quantityTextField.delegate = self
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
