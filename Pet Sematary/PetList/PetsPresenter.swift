//
//  HelpSupportPresenter.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 02/03/23.
//
import Foundation

class PetsPresenter: PetsPresenterProtocol {
  
  var view: PetsVCProtocol?
  var wireframe: PetsWireframeProtocol?
  var interactor: PetsInteractorInputProtocol?
  
  func viewDidLoad() {
    
  }
  
  func viewWillAppear() {
    //MARK: If no task is pending from any managers i.e firebase or notification, will continue normal task.
  }
    func callPetsApi() {
        view?.showLoading(message: "Loading....")
        interactor?.loadPetsData(fileName:"pets_list")
    }
    
    func pushToPetDetails(detailsUrl:String){
        wireframe?.moveToPetDetails(url:detailsUrl)
    }
}

extension PetsPresenter: PetsInteractorOutputProtocol {

    func onGetPetsSuccess(response: Pets){
        view?.hideLoading()
        if (response.pets.count != 0){
            self.view?.reloadData(data:response.pets)
        } else  {
            self.view?.showToast(msg: "Something went wrong!!")
        }
      
    }
    
    /** Just toasting, no view requirements */
    func onPetsError(error: Error) {
        self.view?.hideLoading()
        self.view?.showToast(msg: "Something went wrong!!")
    }
}
