import Foundation
import UIKit

class CustomView: UIView {

    @IBOutlet weak var valueLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        let view = Bundle.main.loadNibNamed("CustomView",
                                       owner: self,
                                       options: nil)?.first as! UIView
        view.frame = bounds
        addSubview(view)
        self.valueLabel.text = "0"
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.valueLabel.text = String(Int(sender.value))
    }
}
