//
//  BaseProtocols.swift
//  SpeedyyiOSApp
//
//  Created by Kartik G on 09/04/19.
//  Copyright © 2022 Speedyy Technologies. All rights reserved.
//

import UIKit

protocol BaseView: NSObjectProtocol {
    func showToastOnWindow(msg: String)
    func showToast(msg: String)
    func hideErrorView()
   
    func showLoading(message: String)
    func hideLoading()
  
}

extension BaseView where Self: BaseUIViewController {
   
    func showToast(msg: String) {
        self.view.makeToast(msg)
    }
    
    func showToastOnWindow(msg: String) {
        if let window = UIApplication.shared.keyWindow {
            window.makeToast(msg)
        }
    }
   
    func showLoading(message: String) {
        self.showLoadingView(msg: message)
    }
    
    func hideLoading() {
        self.hideLoadingView()
    }
   
    func hideLoadingAlert() {
        self.hideLoadingAlertView()
    }
   
}

@objc protocol BasePresenter: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    @objc optional func viewWillDisapper()
}

@objc protocol BaseOutputInteractor: AnyObject {
    
}


// MARK:- Home redirect handling Presenter & WireFrame
