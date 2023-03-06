//
//  PetsProtocol.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

protocol PetsVCProtocol: BaseView {
    var presenter: PetsPresenterProtocol? {get set}
    func reloadData(data:[PetsInfo]?)
}

protocol PetsPresenterProtocol: BasePresenter {
    var view: PetsVCProtocol? {get set}
    var wireframe: PetsWireframeProtocol? {get set}
    var interactor: PetsInteractorInputProtocol? {get set}
    func callPetsApi()
    func pushToPetDetails(detailsUrl:String)
}

protocol PetsWireframeProtocol: AnyObject {
    func moveToPetDetails(url:String)
}

protocol PetsInteractorInputProtocol: AnyObject {
    var presenter: PetsInteractorOutputProtocol? {get set}
    func loadPetsData(fileName:String)
}

protocol PetsInteractorOutputProtocol: AnyObject {
    func onPetsError(error: Error)
    func onGetPetsSuccess(response: Pets)
}
