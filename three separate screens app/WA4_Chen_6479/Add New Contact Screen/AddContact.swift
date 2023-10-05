//
//  AddContact.swift
//  WA4_Chen_6479
//
//  Created by Hanru Chen on 10/4/23.
//

import UIKit

class AddContact: UIView {

    var labelAddNewContact: UILabel!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var labelAddPhone: UILabel!
    var typePicker: UIPickerView!
    var textFieldPhone: UITextField!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZip: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLabelAddNewContact()
        setupTextFieldName()
        setupTextFieldEmail()
        setupLabelAddPhone()
        setupTypePicker()
        setupTextFieldPhone()
        setupTextFieldAddress()
        setupTextFieldCityState()
        setupTextFieldZip()
        initConstraints()   
    }
    
    
    func setupLabelAddNewContact() {
        labelAddNewContact = UILabel()
        labelAddNewContact.text = "Add a New Contact"
        labelAddNewContact.font = labelAddNewContact.font.withSize(20)
        labelAddNewContact.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddNewContact)
    }
    
    func setupTextFieldName() {
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupLabelAddPhone() {
        labelAddPhone = UILabel()
        labelAddPhone.text = "Add Phone"
        labelAddPhone.font = labelAddPhone.font.withSize(16)
        labelAddPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAddPhone)
    }
    
    func setupTypePicker() {
        typePicker = UIPickerView()
        typePicker.isUserInteractionEnabled = true
        typePicker.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(typePicker)
    }
    
    func setupTextFieldPhone() {
        textFieldPhone = UITextField()
        textFieldPhone.placeholder = "Phone number"
        textFieldPhone.keyboardType = .phonePad
        textFieldPhone.borderStyle = .roundedRect
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhone)
    }
    
    func setupTextFieldAddress() {
        textFieldAddress = UITextField()
        textFieldAddress.placeholder = "Address"
        textFieldAddress.borderStyle = .roundedRect
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldAddress)
    }
    
    func setupTextFieldCityState() {
        textFieldCityState = UITextField()
        textFieldCityState.placeholder = "City, State"
        textFieldCityState.borderStyle = .roundedRect
        textFieldCityState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldCityState)
    }
    
    func setupTextFieldZip() {
        textFieldZip = UITextField()
        textFieldZip.placeholder = "ZIP"
        textFieldZip.borderStyle = .roundedRect
        textFieldZip.keyboardType = .numberPad
        textFieldZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldZip)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // 1. labelAddNewContact
            labelAddNewContact.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            labelAddNewContact.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            // 2. textFieldName
            textFieldName.topAnchor.constraint(equalTo: labelAddNewContact.bottomAnchor, constant: 16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 3. textFieldEmail
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 4. labelAddPhone
            labelAddPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            labelAddPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            // 5. typePicker
            typePicker.topAnchor.constraint(equalTo: labelAddPhone.bottomAnchor, constant: 8),
            typePicker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            // 6. textFieldPhone
            textFieldPhone.topAnchor.constraint(equalTo: typePicker.bottomAnchor, constant: 16),
            textFieldPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldPhone.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 7. textFieldAddress
            textFieldAddress.topAnchor.constraint(equalTo: textFieldPhone.bottomAnchor, constant: 16),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 8. textFieldCityState
            textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 16),
            textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldCityState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // 9. textFieldZip
            textFieldZip.topAnchor.constraint(equalTo: textFieldCityState.bottomAnchor, constant: 16),
            textFieldZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
