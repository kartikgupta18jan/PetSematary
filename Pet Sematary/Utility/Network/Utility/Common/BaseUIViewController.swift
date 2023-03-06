//
//  RBaseUIViewController.swift
//  BNBiOSUserApp
//
//  Created by Kartik G on 03/04/19.
//  Copyright © 2022 Speedyy Techologies. All rights reserved.
//

import UIKit

enum KeyboardHandling {
    case None
    case ScrollViewOffset(scrollview: UIScrollView, sbBottomOffset: CGFloat)
    case ViewResize
}

class BaseUIViewController: UIViewController {
    var appDelegate : AppDelegate {
         return UIApplication.shared.delegate as! AppDelegate
    }
    private var progressInnnerHUD: SNProgressInnerHUD = SNProgressInnerHUD()
    private var keyboardHandling: KeyboardHandling = .None
    private var handleKeyboardShowHide: Bool = false
    private(set) var keyboardHeight: CGFloat = 0
    private var svDefaultInsetKeyboardHandling: UIEdgeInsets = UIEdgeInsets.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUITheme()
        setUI()
    }
    
    /// Helps to set UI-Properties at one place.
    internal func setUI() {}
    
    /// Helps to set UI-Property theme at one place. 
    internal func setUITheme() {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func changeLoadingTheme(bgColor: UIColor = .white) {
        progressInnnerHUD.backgroundColor = .white
    }

    func showLoadingView(msg: String, in parent: UIView? = nil) {
        let superview = (parent == nil) ? self.view : parent
        progressInnnerHUD.show(superview: superview!, msg: msg)
    }
    
    func hideLoadingView() {
      DispatchQueue.main.async {
        self.progressInnnerHUD.hide()
      }
    }
   
    func hideLoadingAlertView() {
      DispatchQueue.main.async {
          self.progressInnnerHUD.removeFromSuperview()
      }
      
    }
    
    func showAlert(message:String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
