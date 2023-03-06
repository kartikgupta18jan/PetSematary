//
//  Theme.swift
//  SpeedyyiOSApp
//
//  Created by Kartik G on 03/05/19.
//  Copyright © 2022 Speedyy Technologies. All rights reserved.
//

import UIKit

class Theme {
    
    static let `default`: Theme = Theme()
    
    static let transparent: Theme = {
        let theme = Theme()
        
        return theme
    }()
    
    var navBarTintColor: UIColor = Color.White.value
    
    var navTintColor: UIColor = UIColor.black
    
    var navBackgroundColor: UIColor = UIColor.clear
    
    var background: UIColor = Color.Beige.value
    
    var navBtnColor: UIColor = Color.Black.value
    
    var navTitleColor: UIColor = Color.Black.value
    
    public var tint: UIColor {
        return Color.Beige.value
    }
    
    public var navtint: UIColor {
        return Color.Beige.value
    }
    
    public var navBackground: UIColor {
        return Color.White.value
    }
    
    public func applyNavTheme() {
        let appearance = UINavigationBar.appearance()
        appearance.isTranslucent = false
        appearance.backgroundColor = navBackground
        appearance.barTintColor = navtint
        appearance.tintColor = Color.White.value
        appearance.barStyle = .blackOpaque
        
        var attrs = [NSAttributedString.Key: Any]()
        
        attrs[.font] = UIFont.systemFont(ofSize: 18, weight: .medium)
        attrs[.foregroundColor] = Color.White.value
        appearance.titleTextAttributes = attrs
        
        var attrsBarButton = [NSAttributedString.Key: Any]()
        
        attrsBarButton[.font] = UIFont.systemFont(ofSize: 16, weight: .regular)
        attrsBarButton[.foregroundColor] = Color.White.value
        
        let barBtnAppearance = UIBarButtonItem.appearance()
        
        for state in [UIControl.State.normal, UIControl.State.focused, UIControl.State.highlighted, UIControl.State.selected] {
            barBtnAppearance.setTitleTextAttributes(attrsBarButton, for: state)
        }
    }
    
    public static func applyThemeRegularFont(to labels: [UILabel], size: CGFloat) {
        labels.forEach {
            $0.font = UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
    
    public static func applyThemeMediumFont(to labels: [UILabel], size: CGFloat) {
        labels.forEach {
            $0.font = UIFont.systemFont(ofSize: size, weight: .medium)
        }
    }
    
    public static func applyThemeLightFont(to labels: [UILabel], size: CGFloat) {
        labels.forEach {
            $0.font = UIFont.systemFont(ofSize: size, weight: .light)
        }
    }
    
    public static func applyThemeBoldFont(to labels: [UILabel], size: CGFloat) {
        labels.forEach {
            $0.font = UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
    
    public static func applyThemeRegularFont(to btns: [UIButton], size: CGFloat) {
        btns.forEach {
            $0.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
    
    public static func applyThemeMediumFont(to btns: [UIButton], size: CGFloat) {
        btns.forEach {
            $0.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: .medium)
        }
    }
    
    public static func applyThemeLightFont(to btns: [UIButton], size: CGFloat) {
        btns.forEach {
            $0.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: .light)
        }
    }
    
    public static func applyThemeBoldFont(to btns: [UIButton], size: CGFloat) {
        btns.forEach {
            $0.titleLabel?.font = UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
    
    public static func applyThemeRegularFont(to txtFields: [UITextField], size: CGFloat) {
        txtFields.forEach { text in
            text.font = UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
    
    public static func applyThemeBoldFont(to txtFields: [UITextField], size: CGFloat) {
        txtFields.forEach { text in
            text.font = UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
    
    public static func applyThemeColor(to labels: [UILabel], color: UIColor) {
        labels.forEach {
            $0.textColor = color
        }
    }
    
    public static func applyThemeTextButtonColor(to labels: [UIButton], color: UIColor) {
        labels.forEach {
            $0.titleLabel?.textColor = color
        }
    }
    
    public static func applyBackgroundThemeColor(to labels: [UILabel], color: UIColor) {
        labels.forEach {
            $0.backgroundColor = color
        }
    }
    
    
    public static func applyThemeColor(to labels: [UIButton], color: UIColor) {
        labels.forEach {
            $0.backgroundColor = color
        }
    }
    
    public static func applyThemeBackgroundColor(to labels: [UIView], color: UIColor) {
        labels.forEach { label in
            label.backgroundColor = color
        }
    }
    
    public static func applyThemeTintColor(to txtFields: [UITextField], color: UIColor) {
        txtFields.forEach { text in
            text.tintColor = color
        }
    }
  
    public static func applyTextThemeColor(to labels: [UILabel], color: UIColor) {
      labels.forEach {
        $0.textColor = color
      }
    }
    
}
