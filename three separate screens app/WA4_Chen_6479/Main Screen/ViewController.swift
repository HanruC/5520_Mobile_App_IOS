//
//  ViewController.swift
//  WA4_Chen_6479
//
//  Created by Hanru Chen on 10/4/23.
//

import UIKit

class ViewController: UIViewController {
    let firstScreen = FirstScreenView()
    
    var contacts = [Contact]()
    
    override func loadView() {
        view = firstScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        
        firstScreen.tableViewContact.delegate = self
        firstScreen.tableViewContact.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddBarButtonTapped))
    }
    
    @objc func onAddBarButtonTapped() {
        let addContactController = AddContactViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }
    
    func delegateOnAddContact(contact: Contact) {
        contacts.append(contact)
        firstScreen.tableViewContact.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath)
            as! TableViewContactCell
        if let uwName = contacts[indexPath.row].name {
            cell.labelName.text = uwName
        }
        
        if let uwEmail = contacts[indexPath.row].email {
            cell.labelEmail.text = uwEmail
        }
        if let uwPhone = contacts[indexPath.row].phone, let uwType = contacts[indexPath.row].phoneType {
            cell.labelPhoneAndType.text = "\(uwPhone) (\(uwType))"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailScreenViewController()
        detailViewController.contacts = contacts[indexPath.row]
        
        navigationController?.pushViewController(detailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
