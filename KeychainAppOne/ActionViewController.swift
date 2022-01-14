//
//  ActionViewController.swift
//  KeychainAppOne
//
//  Created by Felix on 13.01.2022.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import KeychainSwift

class KeychainController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var getKeychainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let keychain = KeychainSwift()
        let accessGroup = "group.com.mobiledevelopment.rss" // added prefix for group
        SharedKeychainSwift.start(withKeychain: keychain, accessGroup: accessGroup)
    }
    
    private func setupUI() {
        nameLabel.text = "Name: N/A"
        getKeychainButton.layer.cornerRadius = 8
    }
    
    @IBAction func actionGetKeychainButton(_ sender: UIButton) {
        guard let name = SharedKeychainSwift.get(key: "name") else { return }
        nameLabel.text = "Name: \(name)"
        
    }
    
}
