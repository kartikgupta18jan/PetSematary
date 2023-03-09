//
//  SNProgressInnerHUD.swift
//  SpeedyyiOSApp
//
//  Created by Kartik G on 12/04/19.
//  Copyright © 2022 Speedyy Technologies. All rights reserved.
//

import UIKit

class SNProgressInnerHUD: UIView {
    
    private var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.color = Color.headerViewYellow.value
        return activityIndicator
    }()
    
    private var activityLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setTheme()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setMessage(msg: String?) {
        activityLabel.text = msg
    }
    
    private func addView() {
        containerView.setSubviewsForAutoLayout([activityIndicator, activityLabel])
        self.setSubviewForAutoLayout(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: containerView.topAnchor),
            
            activityLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            activityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            activityLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            activityLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 5)
            ])
    }
    
    private func setTheme() {
        self.backgroundColor = Color.White.value//Color.Beige.value
        //        activityLabel.textColor = Color.Greyish.value
        //        activityIndicator.color = Color.GreenBlue.value
        activityIndicator.startAnimating()
    }
    
    private func configure() {}
    
    public func show(superview: UIView) {
        show(superview: superview, msg: "Loading...")
    }
    
    public func show(superview: UIView, msg: String?) {
        setMessage(msg: msg)
        superview.setSubviewForAutoLayout(self)
        NSLayoutConstraint.activate([
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            self.topAnchor.constraint(equalTo: superview.topAnchor)
            ])
        superview.bringSubviewToFront(self)
    }
    
    public func hide() {
        if self.superview != nil {
            self.removeFromSuperview()
        }
    }
    
}
