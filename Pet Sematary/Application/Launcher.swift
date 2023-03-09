//
//  Launcher.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 09/03/23.
//


import UIKit

class Launcher {
    
    static func launch(with window: UIWindow?) {
        if let nc = window?.rootViewController as? UINavigationController,
            let petVC = nc.viewControllers.first as? PetsViewController {
            let viewModel = PetsViewModel()
            petVC.viewModel = viewModel
            petVC.router = DefaultPetsRouter()
        }
    }
}
