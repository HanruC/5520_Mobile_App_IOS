//
//  AddContactViewController.swift
//  WA4_Chen_6479
//
//  Created by Hanru Chen on 10/4/23.
//

import UIKit

class AddContactViewController: UIViewController {
    
    var delegate: ViewController! 
    
    var selectedType = "Cell"
    
    let addContactScreen = AddContact()

    override func loadView() {
        view = addContactScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
        
        addContactScreen.typePicker.dataSource = self
        addContactScreen.typePicker.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(onSaveButtonTapped))

    }
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    
    @objc func onSaveButtonTapped() {
        
        var name: String?
        if let nameText = addContactScreen.textFieldName.text {
            if !nameText.isEmpty{
                name = nameText
            }
            else {
                showAlert(message: "Name cannot be empty.")
                return
            }
        }
        
        var email: String?
        if let emailText = addContactScreen.textFieldEmail.text {
            if isValidEmail(emailText) {
                email = emailText
            } else {
                showAlert(message: "Enter valid email.")
                return
            }
            
        var phone: String?
        if let phoneText = addContactScreen.textFieldPhone.text {
            if isValidPhone(phoneText) {
                phone = phoneText
            } else {
                showAlert(message: "Enter valid phone")
                return
            }
        }
        
        guard let addressText = addContactScreen.textFieldAddress.text, !addressText.isEmpty else {
            showAlert(message: "Address cannot be empty.")
            return
        }
            
        guard let cityStateText = addContactScreen.textFieldCityState.text, !cityStateText.isEmpty else {
            showAlert(message: "City and State cannot be empty.")
            return
        }
            
        guard let zipCodeText = addContactScreen.textFieldZip.text, isValidZip(zipCodeText) else {
            showAlert(message: "Enter a valid zip code.")
            return
        }
            
            
            
        let newContact = Contact(name: name, email: email, phoneType: selectedType, phone: phone, address: addressText, cityState: cityStateText, zipCode: zipCodeText)

        delegate.delegateOnAddContact(contact: newContact) // communicate witht viewcontroller
        navigationController?.popViewController(animated: true) // pop back to the main screen after clicking save
    }


    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPhone(_ phone: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"
        let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePred.evaluate(with: phone)
    }
    
    func isValidZip(_ zip: String) -> Bool {
        if zip.count == 5, let zipInt = Int(zip), zipInt >= 1 && zipInt <= 99950 {
            return true
        }
        return false
    }

}

extension AddContactViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return phoneType.types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedType = phoneType.types[row]
        return phoneType.types[row]
    }
}
