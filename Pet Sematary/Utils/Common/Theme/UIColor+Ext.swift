//
//  UIColor+Ext.swift
//  SpeedyyiOSApp
//
//  Created by Kartik G on 09/04/19.
//  Copyright © 2022 Speedyy Technologies. All rights reserved.
//

import UIKit

enum Color: String {
    
    // Speedyy Color
    case speedyyThemeColor = "#E7E7E8"
    case pinkColor = "#FF604A"
    case cancelledColor = "#D71645"
    case refrenceBackground = "#F8F8F9"
    case cancelledBackground = "#FCEDEE"
    case greyBorderColor = "#b9c1ca"
    case backButtonBackground = "#F2F5F8"
    case headerViewYellow = "#FCD400"
    case darkBlue = "#091223"
    case itemGrey = "#50616E"
    case borderColor = "#E7ECEF"
    //case FilterBackgroundBlack = "#2D2A2E"
    case buttonLightGrey = "#8D9DA8"
    case light_order_gray = "#F3F5F8"
   // case textGrey = "#1C2A38"
    case bannerYellow = "#FACF2C"
    case lightGrey = "#E5E5EA"
    
    // Revamp Color
    case Gray = "#6D7E8B"
    case Black = "#000000"
    case Green = "#04A971"
 
    case ViewBorderColor = "#F0F4F5"
    case BlackTwo = "#262626"
    case BlackThree = "#333333"
    case TrueGreen = "#008a00"
    case White = "#FFFFFF"
    case Beige = "#f8f7f0"
    case GreyishBrown = "#595959"
    case GreyishBrownTwo = "#4e4e4e"
    case LightTan = "#e3dfc5"
    case Red = "#eb0c00"
    case BrownishGray = "#666666"
    case BrownGreyOrWarmGrey = "#999999"
    case BrownGreyThree = "#9c9c9c"
    case EggShell = "#e6e4d7"
    case BrownGreyTwo = "#afafaf"
    case VeryLightPink = "#cdcdcd"
    case VeryLightPinkTwo = "#cbcbcb"
    case VeryLightPinkThree = "#ebebeb"
    case VeryLightPinkFour = "#c5c5c5"
    case VeryLightPinkFive = "#fff7f7"
    case VeryLightPinkSix = "#d8d8d8"
    case VeryLightPinkSeven = "#dddddd"
    case VeryLightPinkSix_Two = "#eeeeee"
    case VeryLightPinkEight = "#f1f1f1"
    
    case Cement = "#9e9d9a"
    case True_Green_Two = "#008d00"
    case Light_Grey = "#eeede7"
    case SoftPink = "#ffa1a8"
    case Manilla = "#fbf38e"
    case Watermelon = "#ff4b5a"
    case GreenBlue = "#00cf70"
    case Light_Peach = "#e6cbcb"
    case Snow = "#FBFBFB"
    case Duck_Egg_Blue = "#d2ecfc"
    case Black_50 = "#80000000"
    
    case Text_gray = "#838383"
    case White_two = "#f6f6f6"
    case White_F9 = "#f9f9f9"
    case OffWhite = "#f7f5e8"
    
    case Duck_Egg_blue_2 = "#c5e6f9"
    case Pig_Pink = "#f3b3d5"
    case PaleGrey = "#f8fafb"
    case WhiteThree = "#fafafa"
    case Red_text = "#ef3d33"
    case Dotted_line_color = "#979797"
    
    case pastelRed = "#ea4c4c"
    case clearBlue = "#317ef0"
    case redBrown = "#703415"
    case ocher = "#c59711"
    case Watermelon_two = "#ff4c5a"
    case Ice_Blue = "#fcfeff"
    case Greyish_Brown_Three = "#4a4a4a"
    case Greyish = "#b4b4b4"
    
    case Black_12 = "#1e000000"
    case Reddish_Pink = "#ff3253"
    case clear_code = "#fff"
    case HoneyDew = "#f0f8f0"
    case greenBlue = "#00cf6f"
    case warmGrey = "#374956"
    case whiteThree = "#dedede"
    
     case FilterTextBlack = "#0D1D28"
     case FilterYellow = "#FCD810"
     case FilterBackgroundBlack = "#2D2A2E"
    
    case CartLightYellow = "#FDF2CC"
     case CartButtonBackgroundBlack = "#2C2A2E"
    case CartSeparatorGrey = "#F3F4FA"
    case CartDashedYellow = "#FBD500"
//    case CartTextBlack = "#091223"

    case CartCustomiseTextBlack = "#1C2A38"
    case CartCustomiseTextGrey = "#5F6E7A"
    
    case PullHandleGrey = "#ACB8C1"
    case PaymentsDeliveryTitleBlack = "#1D180C"
    case PaymentOptionWhite = "#FEFEFE"
    
    case SearchAddressSeparatorGrey = "#F2F2F2"
    
    case OrderTrackingGrey = "#F6F6F7"
    case OrderTrackingBorderColor = "#D2D9DE"
    case OrderTrackingRed = "#F3374D"
    case OrderTackingGrey = "#E6ECEE"
    
    //case textBlackColor = "#1D180C"
     case MyOrderTrackingLightGrey = "#F6F7F9"
    
    case SearchRestaurantTextFieldBlack = "#464C52"
    case SearchRestaurantTextDisabledGrey = "#878D95"
    
    case LightYellow = "#FFF8E0"

    var value: UIColor {
        return UIColor(hexString: self.rawValue)
    }
    
    func getValueWithAlphaComponent(_ alpha: CGFloat) -> UIColor {
        return UIColor(hexString: self.rawValue)
    }
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
