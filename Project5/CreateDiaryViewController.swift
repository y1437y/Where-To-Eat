import UIKit

class CreateDiaryViewController: UIViewController {
    
    
    @IBOutlet weak var ChangeColorBtn: UIButton!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var EatTextField: UITextField!
    @IBOutlet weak var LikeTextField: UITextField!
    @IBOutlet weak var DislikeTextField: UITextField!
    @IBOutlet weak var StackView: UIStackView!
    @IBOutlet weak var SaveButton: UIButton!
    let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedBackground(_:)))
        view.addGestureRecognizer(tap)
        EatTextField.delegate = self
        LikeTextField.delegate = self
        DislikeTextField.delegate = self
        NameField.delegate = self
        
        ChangeColorBtn.translatesAutoresizingMaskIntoConstraints = false
        StackView.translatesAutoresizingMaskIntoConstraints = false
        SaveButton.translatesAutoresizingMaskIntoConstraints = false
        ChangeColorBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        ChangeColorBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        ChangeColorBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ChangeColorBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        StackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        StackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        SaveButton.topAnchor.constraint(equalTo: StackView.bottomAnchor, constant: 20).isActive = true
        SaveButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        SaveButton.heightAnchor.constraint(equalToConstant: 30)
        SaveButton.widthAnchor.constraint(equalToConstant: 40)
        
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.93, blue: 0.87, alpha: 1)
        createDatePicker()
    }
    
    @objc func tappedBackground(_ sender: UITapGestureRecognizer) {
        NameField.resignFirstResponder()
        EatTextField.resignFirstResponder()
        LikeTextField.resignFirstResponder()
        DislikeTextField.resignFirstResponder()
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard
            let name = NameField.text,
            let date = DateTextField.text,
            let eat = EatTextField.text,
            let like = LikeTextField.text,
            let dislike = DislikeTextField.text
            else { return }
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let diarySavedInCoreDate = Diary(context: context)
        diarySavedInCoreDate.name = name
        diarySavedInCoreDate.date = date
        diarySavedInCoreDate.eat = eat
        diarySavedInCoreDate.like = like
        diarySavedInCoreDate.unlike = dislike
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTapped))
        toolbar.setItems([done], animated: false)
        
        DateTextField.inputAccessoryView = toolbar
        DateTextField.inputView = picker
        
        picker.datePickerMode = .date
    }
    
    @objc func doneButtonTapped() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: picker.date)
        
        DateTextField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    @IBAction func ColorChangeTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations:  {
            self.view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        }, completion: nil)
    }
}

extension CreateDiaryViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
