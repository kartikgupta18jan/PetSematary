//
//  PetsInteractor.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

class PetsInteractor: PetsInteractorInputProtocol {

    var presenter: PetsInteractorOutputProtocol?
    
    func loadPetsData(fileName:String){
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Pets.self, from: data)
                self.presenter?.onGetPetsSuccess(response: jsonData)
            } catch {
                self.presenter?.onPetsError(error: error)
            }
        }
    }
}
