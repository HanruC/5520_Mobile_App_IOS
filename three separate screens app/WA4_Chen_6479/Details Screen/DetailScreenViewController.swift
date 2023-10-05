//
//  DetailScreenViewController.swift
//  WA4_Chen_6479
//
//  Created by Hanru Chen on 10/5/23.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    let detailScreen = DetailScreenView()
    var contacts: Contact?
    
    override func loadView() {
        view = detailScreen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupContactDetails()
    }
    
    func setupContactDetails() {
        if let contact = contacts {
            if let contactName = contact.name {
                detailScreen.labelNameDetail.text = contactName
            }
            
            if let contactEmail = contact.email {
                detailScreen.labelEmailDetail.text = "Email: \(contactEmail)"
            }
            
            if let contactPhone = contact.phone, let contactPhoneType = contact.phoneType {
                detailScreen.labelPhoneDetail.text = "Phone: \(contactPhone) (\(contactPhoneType))"
            }
            
            detailScreen.labelAddress.text = "Address:"
            
            if let contactAddressDetail = contact.address {
                detailScreen.labelAddressDetail.text = contactAddressDetail
            }
            
            if let contactCityState = contact.cityState {
                detailScreen.labelCityState.text = contactCityState
            }
            
            if let contactZipCode = contact.zipCode {
                detailScreen.labelZipCode.text = contactZipCode
            }
        }
    }


    

}
