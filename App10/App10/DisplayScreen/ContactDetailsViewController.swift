import UIKit


class ContactDetailsViewController: UIViewController {
    
    var contact: Contact?
    let detailScreen = ContactDetailsView()
    var mainScreen = ViewController()
    let notificationCenter = NotificationCenter.default
    override func loadView() {
        view = detailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash , target: self, action: #selector(onDeleteBarButtonTapped))
        setupContactDetails()
        
        detailScreen.editButton.addTarget(self, action: #selector(onEditButtonTapped), for: .touchUpInside)
        notificationCenter.addObserver(self, selector: #selector(reloadContactDetails), name: .contactUpdated, object: nil)
    }

    @objc func reloadContactDetails(notification: Notification) {
        if let updatedContact = notification.object as? Contact {
            self.contact = updatedContact
            setupContactDetails()
        }
    }


    @objc func onDeleteBarButtonTapped() {
        let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this contact?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            // Call your delete function here (needs to be added)
            self.deleteContact()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func deleteContact() {
        guard let contactName = contact?.name else { return }
        mainScreen.deleteContact(name: contactName)
        notificationCenter.post(name: .contactUpdated, object: nil)
        navigationController?.popViewController(animated: true)
    }

    @objc func onEditButtonTapped() {
        guard let currentContact = contact else { return }
        
        let editVC = EditContactViewController()
        editVC.contact = currentContact
        editVC.mainScreen = mainScreen
        navigationController?.pushViewController(editVC, animated: true)
    }

    
    func setupContactDetails() {
        guard let contact = contact else { return }
        detailScreen.nameLabel.text = contact.name
        detailScreen.emailLabel.text = contact.email
        detailScreen.phoneLabel.text = "\(contact.phone)"

    }
}
