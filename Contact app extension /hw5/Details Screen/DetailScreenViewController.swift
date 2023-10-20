//
//  DetailScreenViewController.swift
//
//  Created by Hanru Chen on 10/5/23.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    var mainDelegate: ViewController?
    var contactIndex: Int?
    let detailScreen = DetailScreenView()
    var contacts: Contact?
    // var receivedContact: Contact?
    
    override func loadView() {
        view = detailScreen
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit , target: self, action: #selector(onEditBarButtonTapped))
        setupContactDetails()
    }
    
    
    @objc func onEditBarButtonTapped() {
        let editVC = AddContactViewController()
        if let index = contactIndex {
            editVC.selectedContactIndex = index // Setting the index in AddContactViewController
            editVC.editDelegate = self
            editVC.existingContact = mainDelegate?.contacts[index]
            // You can get the contact from mainDelegate's contacts array using the index
        }
        navigationController?.pushViewController(editVC, animated: true)
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
            if let contactImage = contact.image {
                detailScreen.imageContact.image = contactImage
            }
        }
    }

}

extension DetailScreenViewController: EditContactDelegate {
    func contactDidEdit(contact: Contact, at index: Int) {
        // Update the detail screen UI with the edited contact
        self.contacts = contact
        setupContactDetails()

        // Inform the main delegate (ViewController) about the changes
        mainDelegate?.contacts[index] = contact
        mainDelegate?.firstScreen.tableViewContact.reloadData()
    }
}

