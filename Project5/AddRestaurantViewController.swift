import UIKit


class AddRestaurantViewController: UIViewController {

    @IBOutlet weak var RestaurantNameTextField: UITextField!
    @IBOutlet weak var RestaurantStyleTextField: UITextField!
    @IBOutlet weak var RestaurantLocationTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedBackground(_:)))
        view.addGestureRecognizer(tap)
        RestaurantNameTextField.delegate = self
        RestaurantStyleTextField.delegate = self
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Background.png")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)

    }
    
    @objc func tappedBackground(_ sender: UITapGestureRecognizer) {
        RestaurantNameTextField.resignFirstResponder()
        RestaurantStyleTextField.resignFirstResponder()
    }


    @IBAction func AddButtonTapped(_ sender: UIButton) {
        guard
            let name = RestaurantNameTextField.text,
            let style = RestaurantStyleTextField.text,
            let location = RestaurantLocationTextField.text
        else { return }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let restaurantSavedInCoreData = Restaurants(context: context)
        restaurantSavedInCoreData.name = name
        restaurantSavedInCoreData.style = style
        restaurantSavedInCoreData.location = location

        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let _ = navigationController?.popViewController(animated: true)
    }

}


extension AddRestaurantViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
