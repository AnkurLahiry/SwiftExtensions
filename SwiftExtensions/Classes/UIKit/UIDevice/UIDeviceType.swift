//
//  UIDeviceType.swift
//  SwiftExtensions
//
//  Created by Ankur on 16/9/20.
//

import Foundation
import UIKit

public extension UIDevice {
    
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    var carPlay: Bool {
        return UIDevice().userInterfaceIdiom == .carPlay
    }
    
    var iPad: Bool {
        return UIDevice().userInterfaceIdiom == .pad
    }
    
    var tv: Bool {
        return UIDevice().userInterfaceIdiom == .tv
    }
    
    
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case Unknown
    }
    
    var screenType: ScreenType {
        guard iPhone else { return .Unknown}
        switch UIScreen.main.nativeBounds.height {
            case 960:
                return .iPhone4
            case 1136:
                return .iPhone5
            case 1334:
                return .iPhone6
            case 2208:
                return .iPhone6Plus
            case 2436:
                return .iPhoneX
            default:
                return .Unknown
        }
    }
    
}

public extension UIDevice {
    var deviceName : String {
        return UIDevice.current.name
    }
}
