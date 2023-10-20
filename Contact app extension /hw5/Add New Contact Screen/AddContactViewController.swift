//
//  AddContactViewController.swift
//  WA4_Chen_6479
//
//  Created by Hanru Chen on 10/4/23.
//

import UIKit
import PhotosUI

protocol EditContactDelegate: AnyObject {
    func contactDidEdit(contact: Contact, at index: Int)
}


class AddContactViewController: UIViewController {
    
    var editDelegate: EditContactDelegate?
    var pickedImage: UIImage?
    var delegate: ViewController?
    var existingContact: Contact?
    var selectedType: String = "Home"
    var selectedContactIndex: Int?
    
    let addContactScreen = AddContact()

    override func loadView() {
        view = addContactScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contact = existingContact {
            populateFieldWith(contact: contact)
        }
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
        
        addContactScreen.buttonSave.addTarget(self, action: #selector(onSaveButtonTapped), for: .touchUpInside)
        addContactScreen.buttonSelectPhoneType.menu = getMenuTypes()
        addContactScreen.buttonTakePhoto.menu = getMenuImagePicker()

    }
    func populateFieldWith(contact: Contact) {
        addContactScreen.textFieldName.text = contact.name
        addContactScreen.textFieldEmail.text = contact.email
        addContactScreen.textFieldPhone.text = contact.phone
        selectedType = contact.phoneType ?? "Home"
        addContactScreen.buttonSelectPhoneType.setTitle(selectedType, for: .normal)
        addContactScreen.textFieldAddress.text = contact.address
        addContactScreen.textFieldCityState.text = contact.cityState
        addContactScreen.textFieldZip.text = contact.zipCode
        pickedImage = contact.image
        if let image = pickedImage {
            addContactScreen.buttonTakePhoto.setImage(image, for: .normal)
        }
    }
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    func getMenuTypes() -> UIMenu {
        var menuItems = [UIAction]()
        for type in phoneType.types {
            let menuItem = UIAction(title: type, handler: {(_) in
                self.selectedType = type
                self.addContactScreen.buttonSelectPhoneType.setTitle(self.selectedType, for: .normal)
            })
            menuItems.append(menuItem)
        }
        return UIMenu(title: "Select type", children: menuItems)
    }
    
    func getMenuImagePicker() -> UIMenu {
        let menuItems = [
            UIAction(title: "Camera", handler: {(_) in self.pickUsingCamera() }),
            UIAction(title: "Gallery", handler: {(_) in self.pickPhotoFromGallery() })
        ]
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    func pickUsingCamera() {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    func pickPhotoFromGallery() {
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1 // only pick 1 photo
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
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
            
            
            
        let newContact = Contact(name: name, email: email, phoneType: selectedType, phone: phone, address: addressText, cityState: cityStateText, zipCode: zipCodeText, image: pickedImage ?? (UIImage(systemName: "person.fill")))

        if let index = selectedContactIndex {
            // Updating an existing contact
            delegate?.contacts[index] = newContact
            editDelegate?.contactDidEdit(contact: newContact, at: index)
        } else {
            // Adding a new contact
            delegate?.contacts.append(newContact)
        }
        
        delegate?.firstScreen.tableViewContact.reloadData()
        navigationController?.popViewController(animated: true)
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

extension AddContactViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self, completionHandler: {(image, error) in
                    DispatchQueue.main.async {
                        if let uwImage = image as? UIImage {
                            self.addContactScreen.buttonTakePhoto.setImage(uwImage.withRenderingMode(.alwaysOriginal), for: .normal)
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
        
    }
}

extension AddContactViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true)
        if let image = info[.editedImage] as? UIImage {
            self.addContactScreen.buttonTakePhoto.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal
            )
            self.pickedImage = image
        } else {
            self.addContactScreen.buttonTakePhoto.setImage(UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
            self.pickedImage = UIImage(systemName: "person.fill")
            showAlert(message: "Failed to load the selected image. Using default image.")
        }
    }
}
