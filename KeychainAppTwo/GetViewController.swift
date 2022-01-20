//
//  GetViewController.swift
//  KeychainAppTwo
//
//  Created by Felix on 13.01.2022.
//

import UIKit
import KeychainSwift
import JGProgressHUD

class GetViewController: UIViewController {
  
    let profileImageButtonHeight: CGFloat = 120
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var getFromKeychainButton: UIButton!
    @IBOutlet private weak var deleteKeychainButton: UIButton!
    @IBOutlet private weak var succesView: UIView!
    
    var completionHandler: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        succesView.isHidden = true
        nameLabel.text = ""
        passwordLabel.text = ""
        getFromKeychainButton.layer.cornerRadius = 8
        deleteKeychainButton.layer.cornerRadius = 8
    }
    
    @IBAction func getFromKeychainButtonTapped(_ sender: UIButton) {
        showSuccesView()
    }
    
    private func showSuccesView() {
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.style = .dark
        hud.parallaxMode = .alwaysOn
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 1.0, animated: true) {
            self.successView()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                guard let name = SharedKeychainSwift.get(key: "name") else { return }
                guard let password = SharedKeychainSwift.get(key: "password") else { return }
                self.nameLabel.text = "Name: \(name)"
                self.passwordLabel.text = "Password: \(password)"
            }
        }
    }
    
    private func successView() {
        let succes = JGProgressHUDSuccessIndicatorView()
        let hud = JGProgressHUD()
        hud.style = .dark
        hud.show(in: self.view)
        hud.indicatorView = succes
        hud.dismiss(animated: true)
    }
    
    @IBAction func actionDeleteKeychain(_ sender: UIButton) {
      if SharedKeychainSwift.clear() {
          print("Keychain Clear ⚠️")
      }
    }

}

