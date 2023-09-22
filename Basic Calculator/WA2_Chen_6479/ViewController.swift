//
//  ViewController.swift
//  WA2_Chen_6479
//
//  Created by Hanru Chen on 9/21/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumberText: UITextField!
    @IBOutlet weak var secondNumberText: UITextField!
    @IBOutlet weak var operationAdd: UIButton!
    @IBOutlet weak var operationSubtract: UIButton!
    @IBOutlet weak var operationMultiply: UIButton!
    @IBOutlet weak var operationDivide: UIButton!
    @IBOutlet weak var resultOfOperation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultOfOperation.font = UIFont.boldSystemFont(ofSize: resultOfOperation.font.pointSize) //Bald for the default result label
        operationAdd.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        operationSubtract.addTarget(self, action: #selector(subtractTapped), for: .touchUpInside)
        operationMultiply.addTarget(self, action: #selector(multiplayTapped), for: .touchUpInside)
        operationDivide.addTarget(self, action: #selector(divideTapped), for: .touchUpInside)
    }
    
    //Add function
    @objc func addTapped() {
        let text1 = firstNumberText.text
        let text2 = secondNumberText.text
            
        if let unwrappedText1 = text1, let unwrappedText2 = text2 { // check empty
            if unwrappedText1.isEmpty || unwrappedText2.isEmpty {
                showErrorAlert(message: "Error! The numbers cannot be empty!")
                return
            }
            if !isValidNum(unwrappedText1) || !isValidNum(unwrappedText2) {
                //chcek validation
                showErrorAlert(message: "Please correct data type")
                return
            }
            //separte for int and double choices
            if let num1 = Int(unwrappedText1), let num2 = Int(unwrappedText2) {
                let result = num1 + num2
                resultOfOperation.text = "\(result)" // int + int = int
            } else { // else all comes up with double
                let num1 = Double(unwrappedText1)
                let num2 = Double(unwrappedText2)
                if let fnum1 = num1, let fnum2 = num2 {
                    let result = fnum1 + fnum2
                    resultOfOperation.text = "\(result)"
                }
            }
        }
    }
    
    //Subtract function
    @objc func subtractTapped() {
        let text1 = firstNumberText.text
        let text2 = secondNumberText.text
        
        if let unwrappedText1 = text1, let unwrappedText2 = text2 {
            if unwrappedText1.isEmpty || unwrappedText2.isEmpty {
                showErrorAlert(message: "Error! The numbers cannot be empty!")
                return
            }
            if !isValidNum(unwrappedText1) || !isValidNum(unwrappedText2) {
                showErrorAlert(message: "Please correct data type")
                return
            }
            if let num1 = Int(unwrappedText1), let num2 = Int(unwrappedText2) {
                let result = num1 - num2
                resultOfOperation.text = "\(result)"
            } else {
                let num1 = Double(unwrappedText1)
                let num2 = Double(unwrappedText2)
                if let fnum1 = num1, let fnum2 = num2 {
                    let result = fnum1 - fnum2
                    resultOfOperation.text = "\(result)"
                }
            }
        }
    }
    
    //Multiply function
    @objc func multiplayTapped() {
        let text1 = firstNumberText.text
        let text2 = secondNumberText.text
        if let unwrappedText1 = text1, let unwrappedText2 = text2 {
            if unwrappedText1.isEmpty || unwrappedText2.isEmpty {
                showErrorAlert(message: "Error! The numbers cannot be empty!")
                return
            }
            if !isValidNum(unwrappedText1) || !isValidNum(unwrappedText2) {
                showErrorAlert(message: "Please correct data type")
                return
            }
            if let num1 = Int(unwrappedText1), let num2 = Int(unwrappedText2) {
                let result = num1 * num2
                resultOfOperation.text = "\(result)"
            } else {
                let num1 = Double(unwrappedText1)
                let num2 = Double(unwrappedText2)
                if let fnum1 = num1, let fnum2 = num2 {
                    let result = fnum1 * fnum2
                    resultOfOperation.text = "\(result)"
                }
            }
        }
    }
    
    //Divide function
    @objc func divideTapped() {
        let text1 = firstNumberText.text
        let text2 = secondNumberText.text
        if let unwrappedText1 = text1, let unwrappedText2 = text2 {
            if unwrappedText1.isEmpty || unwrappedText2.isEmpty {
                showErrorAlert(message: "Error! The numbers cannot be empty!")
                return
            }
            if !isValidNum(unwrappedText1) || !isValidNum(unwrappedText2) {
                showErrorAlert(message: "Please correct data type")
                return
            }
            if let num1 = Double(unwrappedText1), let num2 = Double(unwrappedText2) {
                if num2 == 0 {
                    //validate the second number (non 0)
                    showErrorAlert(message: "Second number should not be 0")
                    return
                }
                let result = num1 / num2
                resultOfOperation.text = "\(result)"
            }
        }
    }
    
    
    //Validation for text input
    func isValidNum(_ text: String) -> Bool {
        return Int(text) != nil || Double(text) != nil
    } // checking if either int or double
    
    //Error message set up
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
            
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

}

