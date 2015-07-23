import UIKit
import LegoKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let v = UIView()
        v.backgroundColor = .redColor()
        v.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(v)
        
        view |> v.attribute(.CenterX) == view.attribute(.CenterX)
        view |> v.attribute(.CenterY) == view.attribute(.CenterY)
        view |> v.attribute(.Width) == 100
        view |> v.attribute(.Height) == v.attribute(.Width) * 1.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

