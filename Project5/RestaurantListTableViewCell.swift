import UIKit

class RestaurantListTableViewCell: UITableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var StyleLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    
    func decorate (with restaurant: Restaurants) {
        NameLabel.text = restaurant.name
        StyleLabel.text = restaurant.style
        LocationLabel.text = restaurant.location
        let fontsize = self.NameLabel.font.pointSize
        NameLabel.font = UIFont(name: "Marker Felt", size: fontsize)
        StyleLabel.font = UIFont(name: "Marker Felt", size: fontsize)
        LocationLabel.font = UIFont(name: "Marker Felt", size: fontsize)
    }
    
}
