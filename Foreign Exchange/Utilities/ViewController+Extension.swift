
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                     message: message,
                                                     preferredStyle: .alert)

        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                  alertController.addAction(defaultAction)

        DispatchQueue.main.async {
        self.present(alertController, animated: true, completion: nil)
        }

    }
}
