import Foundation
import UIKit

protocol CustomViewDelegate: UIPickerViewDelegate, UIPickerViewDataSource {
    func saveButtonTouched()
}

class CustomView: UIView {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var animalStatusPicker: UIPickerView!

    var delegate: CustomViewDelegate? = nil {
        willSet(newDelegate) {
            self.delegate = newDelegate
            animalStatusPicker.delegate = newDelegate
            animalStatusPicker.dataSource = newDelegate
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }

    @IBAction func saveButtonTouched(_ sender: Any) {
        delegate!.saveButtonTouched()
    }
    
    private func loadView() {
        let view = Bundle.main.loadNibNamed("CustomView",
                                       owner: self,
                                       options: nil)?.first as! UIView
        view.frame = bounds
        addSubview(view)
    }
}
