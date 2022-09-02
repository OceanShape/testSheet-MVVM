import UIKit

protocol ViewControllerDelegate {
    func sendMessage()
}

class ViewController: UIViewController, ViewControllerDelegate {

    @IBOutlet var customView: CustomView!

    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func sendMessage() {
    }
}
