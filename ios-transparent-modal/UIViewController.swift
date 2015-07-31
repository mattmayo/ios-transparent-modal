import UIKit

extension UIViewController {
    func blur(fullScreenImageView: UIImageView) {
        if let keyWindow = UIApplication.sharedApplication().keyWindow, size = UIApplication.sharedApplication().keyWindow?.bounds.size {
            UIGraphicsBeginImageContext(size)
            keyWindow.layer.renderInContext(UIGraphicsGetCurrentContext())
            if let image = UIGraphicsGetImageFromCurrentImageContext() {
                fullScreenImageView.image = image.applyBlurWithRadius(3, tintColor: UIColor.clearColor(), saturationDeltaFactor: 1, maskImage: nil)?.applyDarkEffect()
            }
            UIGraphicsEndImageContext()
        }
    }
}