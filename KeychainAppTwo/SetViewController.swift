//
//  SetViewController.swift
//  KeychainAppTwo
//
//  Created by Felix on 13.01.2022.
//

import UIKit
import KeychainSwift

class SetViewController: UIViewController {
    
    let profileImageButtonHeight: CGFloat = 120
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var getFromKeychainButton: UIButton!
    @IBOutlet weak var deleteKeychainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc
    private func actionProfileImageTapped() {
        
    }
    
    private func setupUI() {
        getFromKeychainButton.layer.cornerRadius = 8
        deleteKeychainButton.layer.cornerRadius = 8
    }
    
    @IBAction func getFromKeychainButtonTapped(_ sender: UIButton) {
        SharedKeychainSwift.set(value: nameLabel.text ?? "", forKey: "name")
    }
    
    @IBAction func actionDeleteKeychain(_ sender: UIButton) {
        SharedKeychainSwift.delete(key: "name")
    }

}

