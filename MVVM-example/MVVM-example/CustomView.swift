import Foundation
import UIKit

class CustomView: UIView {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var animalStatusPicker: UIPickerView!

    var buffer = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }

    @IBAction func saveButtonTouched(_ sender: Any) {
        self.statusLabel.text = buffer
    }
    
    private func loadView() {
        let view = Bundle.main.loadNibNamed("CustomView",
                                       owner: self,
                                       options: nil)?.first as! UIView
        view.frame = bounds
        addSubview(view)
        self.animalStatusPicker.delegate = self
        self.animalStatusPicker.dataSource = self
    }
}

extension CustomView: UIPickerViewDelegate, UIPickerViewDataSource {
    
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

