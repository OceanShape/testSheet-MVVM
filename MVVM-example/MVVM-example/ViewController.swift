import UIKit

class ViewController: UIViewController {

    @IBOutlet var customView: CustomView!

    var viewModel = ViewModel()

    var buffer = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.delegate = self
    }
}
extension ViewController: CustomViewDelegate {

    func saveButtonTouched() {
        self.customView.statusLabel.text = buffer
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return AnimalType.allCases.count
        case 1:
            return 25
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return AnimalType.allCases[row].rawValue
        case 1:
            return String(row)
        default:
            return "NONE"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let animal = AnimalType.allCases[pickerView.selectedRow(inComponent: 0)]
        self.buffer = String(format: "\(animal)(%d)", pickerView.selectedRow(inComponent: 1))
    }
}
