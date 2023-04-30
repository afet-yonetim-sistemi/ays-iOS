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
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userNameTextField.becomeFirstResponder()
    }
    // MARK: Functions
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        viewModel.login(userName: userNameTextField.text, password: passwordTextField.text)
    }
}
extension LoginViewController: LoginViewDelegate {
    /**
     handleOutput triggered by viewmodel
     ## Important Notes ##
     Error: For handle any kind error,
     Set Spinner: For show or hide animator class(kind of activity indicator)
     Login Successfully: After network layer authenticate user
     - parameters:
     -outputs: LoginViewModelOutput
     */
    func handleOutput(_ output: LoginViewModelOutput) {
        switch output {
        case .error(let errorDescription):
            showAlert(alertType: .caution, for: errorDescription, actionName: "Tamam")
        case .setSpinner(let isLoading):
            isLoading ? Animator.shared.showAnimation(viewController: self) : Animator.shared.hideAnimation()
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
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
