import UIKit

class EditContactViewController: UIViewController {
    
    var contact: Contact?
    var editScreen = EditContactView()
    var mainScreen: ViewController? // pass a reference to this if required
    var notificationCenter = NotificationCenter.default
    override func loadView() {
        view = editScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Edit Contact"
        
        if let contact = contact {
            editScreen.textFieldEditName.text = contact.name
            editScreen.textFieldEditEmail.text = contact.email
            editScreen.textFieldEditPhone.text = "\(contact.phone)"
        }
        
        editScreen.buttonUpdate.addTarget(self, action: #selector(onUpdateButtonTapped), for: .touchUpInside)
    }
    
    @objc func onUpdateButtonTapped() {
        guard let name = editScreen.textFieldEditName.text, !name.isEmpty,
              let email = editScreen.textFieldEditEmail.text, !email.isEmpty, isValidEmail(email: email),
              let phoneString = editScreen.textFieldEditPhone.text, let phone = Int(phoneString),
              let currentContact = contact else {
                
                showAlert(title: "Error", message: "Please ensure all fields are correctly filled.")
                return
        }
        
        let updatedContact = Contact(name: name, email: email, phone: phone)
        
        mainScreen?.updateContact(originalName: currentContact.name, updatedContact: updatedContact)
        notificationCenter.post(name: .contactUpdated, object: updatedContact)
        navigationController?.popViewController(animated: true)
    }

    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
    }


}
