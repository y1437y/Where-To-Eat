import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var GetButton: UIButton!
    @IBOutlet weak var TextField: UITextField!
    
    let model = RestaurantModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Background.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        model.getData()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedBackground(_:)))
        view.addGestureRecognizer(tap)
        TextField.delegate = self
        Label.text = ""
        let fontsize = self.Label.font.pointSize
        Label.font = UIFont(name: "Marker Felt", size: fontsize)
    }
    
    @objc func tappedBackground(_ sender: UITapGestureRecognizer) {
        TextField.resignFirstResponder()
    }

    
    @IBAction func GetRestaurantButtonTapped(_ sender: UIButton) {
        
        Label.text = ""
        let ActionSheetMenu = UIAlertController(title: nil, message: "Select", preferredStyle: .actionSheet)
        
        let randomly = UIAlertAction(title: "Randomly select a restaurant", style: .default) { (UIAlertAction) in
            if self.model.getCount() == 0 {
                self.Label.text = "No restaurants yet!"
            }else {
                let RestaurantIndex = self.model.random(self.model.getCount())
                self.Label.text = restaurants[RestaurantIndex].name
            }
        }
        
        let ByStyle = UIAlertAction(title: "Get a restaurant by style", style: .default) { (UIAlertAction) in
            guard let style = self.TextField.text else { return }
            self.Label.text = self.model.getStyle(style: style)
        }
        
        let ByLocation = UIAlertAction(title: "Get a restaurant by location", style: .default) { (UIAlertAction) in
            guard let location = self.TextField.text else { return }
            self.Label.text = self.model.getLocation(location: location)
        }
        
        ActionSheetMenu.addAction(randomly)
        if TextField.text != "" {
            ActionSheetMenu.addAction(ByStyle)
            ActionSheetMenu.addAction(ByLocation)
        }
        present(ActionSheetMenu, animated: true, completion: nil)
    }
}


extension HomePageViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

