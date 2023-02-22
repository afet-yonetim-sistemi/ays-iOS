//
//  LoginViewController.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import UIKit.UIViewController

final class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Properties
    var viewModel: LoginViewModelProtocol!
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        userNameTextField.becomeFirstResponder()
    }
    
    // MARK: Functions
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        viewModel.login(userName: userNameTextField.text, password: passwordTextField.text)
    }
}
extension LoginViewController: LoginViewDelegate {
    func handleOutput(_ output: LoginViewModelOutput) {
        switch output {
        case .error(let errorDescription):
            showError(for: errorDescription)
        case .setSpinner(let isLoading):
            isLoading ? Animator.sharedInstance.showAnimation() : Animator.sharedInstance.hideAnimation()
        case .loginSuccesfully:
            viewModel.navigateHomeView()
        }
    }
    private func showError(for description: String) {
        let alertView = UIAlertController(title: "Uyarı", message: description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Tamam", style: .cancel)
        alertView.addAction(cancelAction)
        present(alertView, animated: true)
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            userNameTextField.endEditing(true)
            passwordTextField.becomeFirstResponder()
        } else {
            textField.endEditing(true)
        }
        return true
    }
}
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
