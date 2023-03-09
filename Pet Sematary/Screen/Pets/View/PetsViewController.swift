//
//  PetsViewController.swift
//  Pet Sematary
//
//  Created by Kartik Gupta on 02/03/23.
//

import UIKit

class PetsViewController: BaseUIViewController {
    // MARK: - Properties
    @IBOutlet private weak var petsCV: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    let reuseIdentifier = "PetsListCellView"
    
    lazy var viewModel = {
        PetsViewModel()
    }()
    
    lazy var configViewModel = {
        ConfigViewModel()
    }()
    
    var router: PetRouter!

    
    private let refreshControl = UIRefreshControl()
    var petList:[Pet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerCVCell()
        initViewModel()
       
    }
   
    private func registerCVCell() {
        petsCV.register(PetsListCellView.nib, forCellWithReuseIdentifier: PetsListCellView.identifier)

        refreshControl.addTarget(self, action: #selector(pullToRefresh(sender:)), for: .valueChanged)
        petsCV.refreshControl = refreshControl

    }
    
    func initViewModel() {
        // Get pets data
        viewModel.getPets()
        
        //Get Config setting
        configViewModel.getConfigSetting()
        
        // Reload Collectionview closure
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.petsCV.reloadData()
            }
        }
        
        //Check config setting
        let currentDate = Date()
        if currentDate.CheckTime(settingTime: configViewModel.setting) == false{
            self.showAlert(message:"The content only be visible during working hours between 9 am to 6 pm on weekdays.")
        }
    }
}

extension PetsViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
   
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.petCellViewModels.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PetsListCellView
        
        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.updateView(cellVM)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
           return CGSize(width: (self.petsCV?.frame.size.width ?? 0)/2 - 5, height: 200)
       }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        router.perform(.details, from: self, url: self.viewModel.petCellViewModels[indexPath.item].content_url)
    }
}
extension PetsViewController {
    // MARK: - Action Methods
    @objc func pullToRefresh(sender: UIRefreshControl) {
        initViewModel()
        self.refreshControl.endRefreshing()
    }
}
