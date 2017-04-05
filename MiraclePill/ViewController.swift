//
//  ViewController.swift
//  MiraclePill
//
//  Created by Raphael M. Hidalgo on 3/28/17.
//  Copyright © 2017 UpliftedStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    
    //IBOutlets for the objects in the ViewController
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerbtn: UIButton!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var zipcode: UILabel!
    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var streetAddressField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var success: UIImageView!
    
    @IBOutlet weak var objectsMinusSuccess: UILabel!
    
    //Variable of the States for statePicker
    let states = ["Alaska","Arkansas","Alabama","California","Maine","New York"]
    
    //Delegate and data sources for objects in View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        countryField.delegate = self
        zipcodeField.delegate = self
        fullNameField.delegate = self
        streetAddressField.delegate = self
        cityField.delegate = self
            }

    
    //Close the textField after pressing enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        
        if statePicker.isHidden == false {
            country.isHidden = true
            countryField.isHidden = true
            zipcode.isHidden = true
            zipcodeField.isHidden = true
        }
        
        
        
    }
    
    
    
    
    //Functions for Picker to appear and dissappear
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        statePickerbtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        success.isHidden = true
        
        //Hides objects overlaying the statePicker
        country.isHidden = false
        countryField.isHidden = false
        zipcode.isHidden = false
        zipcodeField.isHidden = false
    }
    
    
    //buyNowBtn shows success image and hides all others
    @IBAction func buyNowBtn(_ sender: Any) {
        for view in self.view.subviews as [UIView] {
            view.isHidden = true
        }
        success.isHidden = false
        objectsMinusSuccess.isHidden = true
    }

    
    
}





