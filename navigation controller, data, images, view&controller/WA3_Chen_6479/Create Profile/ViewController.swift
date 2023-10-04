//
//  ViewController.swift
//  WA3_Chen_6479
//
//  Created by Hanru Chen on 9/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    //Initializing the first screen view
    let firstScreen = FirstScreenView()
    
    //Types for firstScreen.PhoneType
    let types: [String] = ["Cell", "Work", "Home"]
    
    var selectedType = "Cell"
    
    public struct Package {
        var name: String?
        var email: String?
        var type: String?
        var phone: String?
        var address: String?
        var cityState: String?
        var zip: String?
        
        init(name: String? = nil, email: String? = nil, type: String? = nil, phone: String? = nil, address: String? = nil, cityState: String? = nil, zip: String? = nil) {
            self.name = name
            self.email = email
            self.type = type
            self.phone = phone
            self.address = address
            self.cityState = cityState
            self.zip = zip
        }
    }
    
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstScreen.typePicker.delegate = self
        firstScreen.typePicker.dataSource = self
        
        firstScreen.buttonShowProfile.addTarget(self, action: #selector(onButtonShowProfileTapped), for: .touchUpInside)
    }
    
    @objc func onButtonShowProfileTapped() {
        if let name = firstScreen.textFieldName.text, !name.isEmpty {
            if let email = firstScreen.textFieldEmail.text, isValidEmail(email) {
                if let phone = firstScreen.textFieldPhone.text, isValidPhone(phone) {
                    if let address = firstScreen.textFieldAddress.text, !address.isEmpty {
                        if let cityState = firstScreen.textFieldCityState.text, !cityState.isEmpty {
                            if let zip = firstScreen.textFieldZip.text, isValidZip(zip) {
                                let package = Package(name: name, email: email, type: selectedType, phone: phone, address: address, cityState: cityState, zip: zip)
                                let displayViewController = DisplayViewController()
                                displayViewController.receivedPackage = package
                                navigationController?.pushViewController(displayViewController, animated: true)
                            } else {
                                showAlert(message: "Please enter a valid zip code.")
                            }
                        } else {
                            showAlert(message: "Please enter a city and state.")
                        }
                    } else {
                        showAlert(message: "Please enter an address.")
                    }
                } else {
                    showAlert(message: "Please enter a valid phone number.")
                }
            } else {
                showAlert(message: "Please enter a valid email.")
            }
        } else {
            showAlert(message: "Please enter a name.")
        }
    }

    // Phone number validation
    func isValidPhone(_ phone: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"
        let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePred.evaluate(with: phone)
    }

    
    // Email Validation
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // Zip validation
    func isValidZip(_ zip: String) -> Bool {
        if zip.count == 5, let zipInt = Int(zip), zipInt >= 1 && zipInt <= 99950 {
            return true
        }
        return false
    }

    //alert helper 
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
    
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedType = types[row]
        return types[row]
    }
        
}
    
