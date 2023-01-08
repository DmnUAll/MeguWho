import UIKit

extension UIImageView {

    static func setAsBackground(withImage imageName: String, to viewController: UIViewController) {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.alpha = 0.5
        backgroundImage.backgroundColor = .systemGreen
        backgroundImage.image = UIImage(named: imageName)
        viewController.view.insertSubview(backgroundImage, at: 0)
    }
}
