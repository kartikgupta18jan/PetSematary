//
//  PetsWireframe.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 02/03/23.
//

import UIKit

class PetsWireframe: PetsWireframeProtocol {
  
    static func createHelpSupportModule() -> UIViewController {
        let vc = UIStoryboard.init(name: "Pets", bundle: Bundle.main).instantiateViewController(withIdentifier: "PetsViewController") as? PetsViewController
        let presenter: PetsPresenterProtocol & PetsInteractorOutputProtocol = PetsPresenter()
        let interactor: PetsInteractorInputProtocol = PetsInteractor()
        let router: PetsWireframeProtocol = PetsWireframe()
          
        vc?.presenter = presenter
        presenter.view = vc
        presenter.wireframe  = router
        presenter.interactor = interactor
          
        interactor.presenter = presenter
          
        return vc ?? PetsViewController()
      }
    
    func moveToPetDetails(url:String){
        guard let url = URL(string: url) else {
          return //be safe
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
