import UIKit


class RestaurantListViewController: UIViewController {
    
    @IBOutlet weak var RestaurantListTableView: UITableView!
    @IBOutlet weak var AddRestaurantBtn: UIButton!
    @IBOutlet weak var colorChangeBtn: UIButton!
    let model = RestaurantModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestaurantListTableView.translatesAutoresizingMaskIntoConstraints = false
        AddRestaurantBtn.translatesAutoresizingMaskIntoConstraints = false
        colorChangeBtn.translatesAutoresizingMaskIntoConstraints = false
        AddRestaurantBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        AddRestaurantBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        colorChangeBtn.topAnchor.constraint(equalTo: AddRestaurantBtn.bottomAnchor).isActive = true
        colorChangeBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        RestaurantListTableView.topAnchor.constraint(equalTo: colorChangeBtn.bottomAnchor).isActive = true
        RestaurantListTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        RestaurantListTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        RestaurantListTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        
        RestaurantListTableView.dataSource = self
        view.backgroundColor = UIColor(red: 0.95, green: 0.93, blue: 0.87, alpha: 1)
        RestaurantListTableView.backgroundColor = UIColor(red: 0.95, green: 0.93, blue: 0.87, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        model.getData()
        RestaurantListTableView.reloadData()
    }
    
    @IBAction func ColorChange(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations:  {
            self.view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
            self.RestaurantListTableView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
            self.RestaurantListTableView.reloadData()
        }, completion: nil)
    }
}


extension RestaurantListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantListCell",
                                                     for: indexPath) as? RestaurantListTableViewCell
            else { return UITableViewCell() }
        let restaurantsToShow = restaurants[indexPath.row]
        
        cell.decorate(with: restaurantsToShow)
        cell.backgroundColor = RestaurantListTableView.backgroundColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let restaurantsToDelete = restaurants[indexPath.row]
            context.delete(restaurantsToDelete)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                restaurants = try context.fetch(Restaurants.fetchRequest())
            }
            catch {
                print("Fatching error")
            }
        }
        RestaurantListTableView.reloadData()
    }
    
}
