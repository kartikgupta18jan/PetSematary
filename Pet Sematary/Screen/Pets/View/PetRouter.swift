//
//  PetsWireframe.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 02/03/23.
//

import UIKit

enum PetSegue {
    case details
}

protocol PetRouter {
    func perform(_ segue: PetSegue, from source: PetsViewController,url:String)
}

class DefaultPetsRouter: PetRouter {
    func perform(_ segue: PetSegue, from source: PetsViewController,url:String){
        switch segue {
        case .details:
            guard let url = URL(string: url) else {
              return //be safe
            }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            break
        }
      }
}
