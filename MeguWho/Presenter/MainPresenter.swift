import UIKit

// MARK: - MainPresenter
final class MainPresenter {

    // MARK: - Properties and Initializers
    private weak var viewController: MainController?
    private let imageSet = ImageSet()
    private var timer: Timer?
    private var firstTap = false

    init(viewController: MainController? = nil) {
        self.viewController = viewController
    }
}

// MARK: - Helpers
extension MainPresenter {

    func fireTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            guard let image = self.imageSet.images.values.randomElement() else { return }
            self.viewController?.mainView.resultImageView.image = image
        }
        timer?.fire()
    }

    func userHaveTapped(withCurrentImage currentImage: UIImage?) -> String {
        firstTap.toggle()
        if firstTap {
            timer?.invalidate()
            guard let currentImage = currentImage,
                  let resultString = imageSet.images.filter({$1 == currentImage}).keys.first else {
                return "Someone Else"
            }
            return "Congratulations! You're:\n\(resultString)"
        } else {
            fireTimer()
            return "Tap to find out!"
        }
    }
}
