//
//  PetsViewModel.swift
//  ViewModel
//
//  Created by Kartik Gupta on 02/03/23.
//

import Foundation

class PetsViewModel: NSObject {
    private var petService: PetsServiceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var pets = Pets()
    
    var petCellViewModels = [PetCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

    init(petsService: PetsServiceProtocol = PetsService()) {
        self.petService = petsService
    }
    
    func getPets() {
        petService.getPets(fileName: "pets_list") { success, model, error in
            if success, let pets = model {
                self.fetchData(pets: pets)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(pets: Pets) {
        self.pets = pets // Cache
        var vms = [PetCellViewModel]()
        for pet in pets {
            vms.append(createCellModel(pet: pet))
        }
        petCellViewModels = vms
    }
    
    func createCellModel(pet: Pet) -> PetCellViewModel {
        let image_url = pet.image_url
        let title =  pet.title
        let content_url =  pet.content_url
        let date_added = pet.date_added
        
        return PetCellViewModel(image_url: image_url, title: title, content_url: content_url, date_added: date_added)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> PetCellViewModel {
        return petCellViewModels[indexPath.row]
    }
}
