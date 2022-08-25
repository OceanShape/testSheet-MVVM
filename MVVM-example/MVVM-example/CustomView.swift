import Foundation
import UIKit

class CustomView: UIView {

    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var gradeNumberSlider: UISlider!
    
    @IBOutlet weak var classNumberSlider: UISlider!

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
        self.valueLabel.text = "2학년 8반"
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        let gradeNumber = Int(gradeNumberSlider.value)
        let classNumber = Int(classNumberSlider.value)
        gradeNumberSlider.value = Float(gradeNumber)
        classNumberSlider.value = Float(classNumber)
        
        self.valueLabel.text = String(format: "%d학년 %d반", gradeNumber, classNumber)
    }
}
