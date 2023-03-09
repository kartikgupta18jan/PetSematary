//
//  PetsViewModel.swift
//  MVVMExample
//
//  Created by John Codeos on 06/19/20.
//

import Foundation

class PetsViewModel: NSObject {
    private var petService: PetsServiceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var pets = Pet()
    
    var petCellViewModels = [PetCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

    init(petsService: PetsServiceProtocol = PetsService()) {
        self.petService = petsService
    }
    
    func getEmployees() {
        petService.getPets { success, model, error in
            if success, let pets = model {
                self.fetchData(pet: pets)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(pet: Pet) {
        self.pets = pets // Cache
        var vms = [PetCellViewModel]()
        for pet in pets {
            vms.append(createCellModel(pet: pet))
        }
        petCellViewModels = vms
    }
    
    func createCellModel(pet: Pet) -> PetCellViewModel {
        var image_url = pet.image_url
        var title =  pet.title
        var content_url =  pet.content_url
        var date_added = pet.date_added
        
        return PetCellViewModel(image_url: image_url, title: title, content_url: content_url, date_added: date_added)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PetCellViewModel {
        return petCellViewModels[indexPath.row]
    }
}
