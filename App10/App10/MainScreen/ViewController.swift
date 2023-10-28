

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    var contactNames = [String]()
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(self, selector: #selector(reloadContactsAfterDeletion), name: .contactDeleted, object: nil)
        notificationCenter.addObserver(self, selector: #selector(reloadContactsAfterUpdate), name: .contactUpdated, object: nil)

        title = "Contacts API Testing"
        mainScreen.tableViewContacts.dataSource = self
        mainScreen.tableViewContacts.delegate = self
 
        //MARK: removing the separator line...
        mainScreen.tableViewContacts.separatorStyle = .none
        
        mainScreen.buttonAdd.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
        
        getAllContacts()
    }
    
    @objc func reloadContactsAfterDeletion() {
        getAllContacts()
    }
    
    @objc func reloadContactsAfterUpdate() {
        getAllContacts()
    }

    
    @objc func onButtonAddTapped() {
        guard let name = mainScreen.textFieldAddName.text, !name.isEmpty,
              let email = mainScreen.textFieldAddEmail.text, !email.isEmpty,
              isValidEmail(email),
              let phoneText = mainScreen.textFieldAddPhone.text, !phoneText.isEmpty,
              isValidPhoneNumber(phoneText),
              let phone = Int(phoneText) else {
            // Handle the validation error here
            showAlert(title: "Error", message: "Please ensure all fields are correctly filled.")

            return
        }
        
        let contact = Contact(name: name, email: email, phone: phone)
        addANewContact(contact: contact)
    }

    
    //MARK: add a new contact call: add endpoint...
    func addANewContact(contact: Contact){
        if let url = URL(string: APIConfigs.baseURL+"add"){
            
            AF.request(url, method:.post, parameters:
                        [
                            "name": contact.name,
                            "email": contact.email,
                            "phone": contact.phone
                        ])
                .responseString(completionHandler: { response in
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...
                                self.getAllContacts()
                                self.clearAddViewFields()
                                self.notificationCenter.post(name: .contactUpdated, object: nil)
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
        }else{
            showAlert(title: "Error", message: "Invalid server URL.")
        }
    }
    
    func clearAddViewFields(){
        mainScreen.textFieldAddName.text = ""
        mainScreen.textFieldAddEmail.text = ""
        mainScreen.textFieldAddPhone.text = ""
    }
    
    //MARK: get all contacts...
    func getAllContacts(){
        if let url = URL(string: APIConfigs.baseURL + "getall"){
            AF.request(url, method: .get).responseString(completionHandler: { response in
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                var names = data.components(separatedBy: "\n")
                                self.contactNames = names
                                self.contactNames.removeLast()
                                self.mainScreen.tableViewContacts.reloadData()
                                print(self.contactNames)
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        } else {
            showAlert(title: "Error", message: "Invalid server URL.")
        }
    }
    
    
    func getContactDetails(name: String){
        let parameters = ["name":name]
        if let url = URL(string: APIConfigs.baseURL+"details"){
            AF.request(url, method:.get,
                       parameters: ["name":name],
                       encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //MARK: status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            let parts = data.components(separatedBy: ",")
                            let name = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
                            let email = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
                            if let phone = Int(parts[2].trimmingCharacters(in: .whitespacesAndNewlines)) {
                                let contact = Contact(name: name, email: email, phone: phone)
                                self.navigateToContactDetails(contact: contact)
                            }
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }else {
            showAlert(title: "Error", message: "Invalid server URL.")
        }
    }
    func navigateToContactDetails(contact: Contact) {
        let contactDetailsVC = ContactDetailsViewController()
        contactDetailsVC.contact = contact
        contactDetailsVC.mainScreen = self
        self.navigationController?.pushViewController(contactDetailsVC, animated: true)
        
    }
    

    func deleteContact(name: String) {
        if let url = URL(string: APIConfigs.baseURL + "delete") {
            AF.request(url, method: .get, parameters: ["name": name])
                .responseString(completionHandler: { response in
                    
                    let status = response.response?.statusCode
                    
                    switch response.result {
                    case .success(let data):
                        if let uwStatusCode = status {
                            switch uwStatusCode {
                            case 200...299:
                                // The request was successful, update the contact list
                                self.notificationCenter.post(name: .contactDeleted, object: nil)
                                break
                                
                            case 400...499:
                                print("Error deleting contact:", data)
                                break
                                
                            default:
                                print("Error deleting contact:", data)
                                break
                            }
                        }
                    case .failure(let error):
                        print("Error deleting contact:", error)
                    }
                })
        } else {
            showAlert(title: "Error", message: "An error occurred when processing your request. Please try again later.")

        }
    }
    
    func updateContact(originalName: String, updatedContact: Contact) {
        if let url = URL(string: APIConfigs.baseURL + "delete") {
            AF.request(url, method: .get, parameters: ["name": originalName])
                .responseString(completionHandler: { response in
                    
                    let status = response.response?.statusCode
                    
                    switch response.result {
                    case .success(let data):
                        if let uwStatusCode = status {
                            switch uwStatusCode {
                            case 200...299:
                                // If the deletion was successful, add the edited contact
                                self.addANewContact(contact: updatedContact)
                                break
                                
                            case 400...499:
                                print("Error deleting contact during update:", data)
                                break
                                
                            default:
                                print("Error deleting contact during update:", data)
                                break
                            }
                        }
                    case .failure(let error):
                        print("Network error during contact update:", error)
                    }
                })
        } else {
            showAlert(title: "Error", message: "Invalid server URL.")
        }
    }


    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneCharacterSet = CharacterSet.decimalDigits
        return phoneNumber.trimmingCharacters(in: phoneCharacterSet).isEmpty
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! ContactsTableViewCell
        cell.labelName.text = contactNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getContactDetails(name: self.contactNames[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
