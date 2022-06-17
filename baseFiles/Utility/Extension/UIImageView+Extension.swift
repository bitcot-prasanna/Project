//
//  UiImageView+Extension.swift
//  PickPic
//
//  Created by Tarun Sahu on 27/02/21.
//

import Foundation
import UIKit
extension UIImageView {
    /// Find the size of the image, once the parent imageView has been given a contentMode of .scaleAspectFit
    /// Querying the image.size returns the non-scaled size. This helper property is needed for accurate results.
    var aspectFitSize: CGSize {
        guard let image = image else { return CGSize.zero }

        var aspectFitSize = CGSize(width: frame.size.width, height: frame.size.height)
        let newWidth: CGFloat = frame.size.width / image.size.width
        let newHeight: CGFloat = frame.size.height / image.size.height

        if newHeight < newWidth {
            aspectFitSize.width = newHeight * image.size.width
        } else if newWidth < newHeight {
            aspectFitSize.height = newWidth * image.size.height
        }
       
        return aspectFitSize
    }

    /// Find the size of the image, once the parent imageView has been given a contentMode of .scaleAspectFill
    /// Querying the image.size returns the non-scaled, vastly too large size. This helper property is needed for accurate results.
    var aspectFillSize: CGSize {
        guard let image = image else { return CGSize.zero }

        var aspectFillSize = CGSize(width: frame.size.width, height: frame.size.height)
        let newWidth: CGFloat = frame.size.width / image.size.width
        let newHeight: CGFloat = frame.size.height / image.size.height

        if newHeight > newWidth {
            aspectFillSize.width = newHeight * image.size.width
        } else if newWidth > newHeight {
            aspectFillSize.height = newWidth * image.size.height
        }

        return aspectFillSize
    }
    
    var imageRect: CGRect {
          guard let imageSize = self.image?.size else { return self.frame }

          let scale = UIScreen.main.scale

          let imageWidth = (imageSize.width / scale).rounded()
          let frameWidth = self.frame.width.rounded()

          let imageHeight = (imageSize.height / scale).rounded()
          let frameHeight = self.frame.height.rounded()

          let ratio = max(frameWidth / imageWidth, frameHeight / imageHeight)
          let newSize = CGSize(width: imageWidth * ratio, height: imageHeight * ratio)
          let newOrigin = CGPoint(x: self.center.x - (newSize.width / 2 ), y: self.center.y - (newSize.height / 2 ))
          return CGRect(origin: newOrigin, size: newSize)
      }
    
    
      func enableZoom() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
        isUserInteractionEnabled = true
        addGestureRecognizer(pinchGesture)
      }

      @objc
      private func startZooming(_ sender: UIPinchGestureRecognizer) {
        let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
        guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
        sender.view?.transform = scale
        sender.scale = 1
      }
    


}
