//
//  DisplayViewController.swift
//  WA3_Chen_6479
//
//  Created by Hanru Chen on 9/28/23.
//

import UIKit

class DisplayViewController: UIViewController {
    
    let displayScreen = DisplayView()
    
    override func loadView() {
        view = displayScreen
    }
    
    //information from first screen which is createprofile screen
    var receivedPackage: ViewController.Package = ViewController.Package()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Unwrapping for name
        if let unwrappedName = receivedPackage.name, !unwrappedName.isEmpty {
            displayScreen.labelName.text = "Name: \(unwrappedName)"
        }
        
        // Unwrapping for email
        if let unwrappedEmail = receivedPackage.email, !unwrappedEmail.isEmpty {
            displayScreen.labelEmail.text = "Email: \(unwrappedEmail)"
        }
        
        // Unwrapping for phone and type
        if let unwrappedPhone = receivedPackage.phone, !unwrappedPhone.isEmpty,
           let unwrappedType = receivedPackage.type, !unwrappedType.isEmpty {
            displayScreen.labelPhone.text = "Phone: \(unwrappedPhone) (\(unwrappedType))"
            displayScreen.phoneTypeImageView.image = UIImage(named: unwrappedType.lowercased())
        }
        
        
        if let unwrappedAddress = receivedPackage.address, !unwrappedAddress.isEmpty {
            displayScreen.labelAddress.text = "Address: \(unwrappedAddress)"
        }
        
        if let unwrappedCityState = receivedPackage.cityState, !unwrappedCityState.isEmpty {
            displayScreen.labelCityState.text = "\(unwrappedCityState)"
        }
        
        if let unwrappedZip = receivedPackage.zip, !unwrappedZip.isEmpty {
            displayScreen.labelZip.text = "ZIP: \(unwrappedZip)"
        }
    }
}
