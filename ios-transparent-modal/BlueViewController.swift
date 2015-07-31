import UIKit

class BlueViewController: UIViewController {

    @IBOutlet var blurImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.blurImageView.layer.zPosition = 1000
    }

    @IBAction func openModalButtonTouched(sender: UIButton) {
        self.blurImageView.alpha = 0
        self.blurImageView.tintColor = UIColor.blackColor()
        UIView.animateWithDuration(0.3) { () -> Void in
            // Comment out line below for transparent
            self.blurAndDarkEffect(self.blurImageView)
            self.blurImageView.alpha = 1
        }
        
        if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let blueViewController = storyboard.instantiateViewControllerWithIdentifier("modal-view-controller") as? UIViewController {
                blueViewController.view.backgroundColor = UIColor.clearColor()
                self.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                self.presentViewController(blueViewController, animated: true, completion: nil)
            }
        } else {
            self.performSegueWithIdentifier("blue-to-modal", sender: self)
        }
    }
    
    @IBAction func unwindFromModal(segue: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            UIView.animateWithDuration(0.2) { () -> Void in
                self.blurImageView.alpha = 0
            }
        })
    }
}