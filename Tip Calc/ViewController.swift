//
//  ViewController.swift
//  Tip Calc
//
//  Created by Eason Chang on 12/13/16.
//
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var zip: UILabel!
    
    let manager = CLLocationManager()
    var zipcode = 0
    
    //Locate the current locaiton of user and try to get a zip code.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let location = locations[0]
        
        
        //Trying to get the zip code from the location of the user
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil{
                print("There was an error")
            }else{
                if let place = placemark?[0]{
                    self.zip.text=place.postalCode
                    self.zipcode = Int(place.postalCode!)!
                }
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self //to receive the update event
        manager.desiredAccuracy = kCLLocationAccuracyBest //accuracy of the location data
        manager.requestWhenInUseAuthorization() //request to use the location services when the app is running
        manager.startUpdatingLocation() //starts generation of updates that reports the user's current heading
        
    }
    
    //Collapse the number pad when tapping other places
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
        
    
    
    @IBAction func calTips(_ sender: Any) {
        let tipPercentage = [0.1, 0.12, 0.15, 0.18, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calTipBar(_ sender: Any) {
        let tipPercentage = [0.1, 0.12, 0.15, 0.18, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    
}

