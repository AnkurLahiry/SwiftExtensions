//
//  FaceDetection.swift
//  SwiftExtensions
//
//  Created by Ankur on 20/9/20.
//

import Foundation
import UIKit

public extension UIImage {
    
    var isFaceAvailable : Bool {
        guard let faces = faces() else {
            return false
        }
        return !faces.isEmpty
    }
    
    var containsMultipleFaces : Bool {
        guard let faces = faces() else {
            return false
        }
        if faces.count > 1 {
            return true
        } else {
            return false
        }
    }
    
    
    private func faces() -> [CIFeature]? {
        guard let cgImage = self.cgImage else {
            return nil
        }
        let ciImage = CIImage(cgImage: cgImage)
        let options = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        guard let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: options) else {
            return nil
        }
        let faces = faceDetector.features(in: ciImage)
        return faces
    }
    
}
