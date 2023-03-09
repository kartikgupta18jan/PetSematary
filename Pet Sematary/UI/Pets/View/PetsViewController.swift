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
    var presenter: PetsPresenterProtocol?
    
    let reuseIdentifier = "PetsListCellView"
    
    private let refreshControl = UIRefreshControl()
    var petList:[PetsInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerCVCell()
        presenter?.callPetsApi()
       
    }
    override func viewDidAppear(_ animated: Bool) {

    }
    override func viewDidLayoutSubviews() {
        
    }
   
    func setData(){
        showAlert(message:"The content only be visible during working hours between 9 am to 6 pm on weekdays.")
    }
    private func registerCVCell() {
        petsCV.register(PetsListCellView.nib, forCellWithReuseIdentifier: PetsListCellView.identifier)

        refreshControl.addTarget(self, action: #selector(pullToRefresh(sender:)), for: .valueChanged)
        petsCV.refreshControl = refreshControl

    }
}

extension PetsViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
   
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.petList?.count ?? 0
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! PetsListCellView
        
        if let pet = self.petList?[indexPath.item]{
            cell.updateView(pet)
        }
        
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
        
        let currentDate = Date()
        if currentDate.CheckTime() == true{
            presenter?.pushToPetDetails(detailsUrl:self.petList?[indexPath.item].content_url ?? "")
            
        }else{
            showAlert(message:"The content only be visible during working hours between 9 am to 6 pm on weekdays.")
        }
        
    }
}
extension PetsViewController {
    // MARK: - Action Methods
    @objc func pullToRefresh(sender: UIRefreshControl) {
        presenter?.callPetsApi()
        self.refreshControl.endRefreshing()
    }
}
extension PetsViewController: PetsVCProtocol {
    func reloadData(data: [PetsInfo]?) {
        self.petList = data
        self.petsCV.reloadData()
    }
    
    func showToastOnWindow(msg: String) {
        //
    }
    
    func showToast(msg: String) {
        //
    }
    
    func hideErrorView() {
        //
    }
    
    func showLoading(message: String) {
        //
    }
    
    func hideLoading() {
        //
    }
    
}
