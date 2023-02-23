//
//  LoginViewController.swift
//  Driver
//
//  Created by Fatih Doğan on 22.02.2023.
//

import UIKit.UIViewController

final class LoginViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: Properties
    var viewModel: LoginViewModelProtocol!
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
            showAlert(alertType: .caution, for: errorDescription, actionName: "Tamam")
        case .setSpinner(let isLoading):
            isLoading ? Animator.sharedInstance.showAnimation(viewController: self) : Animator.sharedInstance.hideAnimation()
        case .loginSuccesfully:
            viewModel.navigateHomeView()
        }
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
