//
//  GetViewController.swift
//  KeychainAppTwo
//
//  Created by Felix on 13.01.2022.
//

import UIKit
import KeychainSwift

class GetViewController: UIViewController {
    
    let profileImageButtonHeight: CGFloat = 120
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var getFromKeychainButton: UIButton!
    @IBOutlet private weak var deleteKeychainButton: UIButton!
    @IBOutlet private weak var succesView: UIView!
    
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
        guard let name = SharedKeychainSwift.get(key: "name") else { return }
        guard let password = SharedKeychainSwift.get(key: "password") else { return }
        showSuccesView()
        nameLabel.text = "Name: \(name)"
        passwordLabel.text = "Password: \(password)"
        
        
    }
    
    private func showSuccesView() {
        
    }
    
    @IBAction func actionDeleteKeychain(_ sender: UIButton) {
        SharedKeychainSwift.delete(key: "name")
        SharedKeychainSwift.delete(key: "password")
    }

}

