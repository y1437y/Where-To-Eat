import UIKit
import Foundation

var restaurants: [Restaurants] = []


class RestaurantModel {
    
    private var HasMatchedRestaurant: Bool = false
    private var googleSearch = "https://www.google.com/search?q="
    
    func getCount() -> Int {
        return restaurants.count
    }
    
    func getSearchString(userSearch:String) -> URL {
        var searchString = googleSearch + userSearch
        searchString = searchString.replacingOccurrences(of: " ", with: "+")
        let searchURL = convertStringToURL(search: searchString)
        return searchURL
    }
    
    func convertStringToURL(search:String) -> URL {
        return URL(string: search)!
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            restaurants = try context.fetch(Restaurants.fetchRequest())
        }
        catch {
            print("Fatching error")
        }
    }
    
    func random(_ n:Int) -> Int
    {
        if n == 1 {
            return 0
        }
        else {
            return Int(arc4random_uniform(UInt32(n)))
        }
    }
    
    func getStyle(style: String) -> String {
        HasMatchedRestaurant = false
        var matchedRestaurants = [String]()
        for size in 0..<getCount() {
            if style == restaurants[size].style {
                matchedRestaurants.append(restaurants[size].name!)
                HasMatchedRestaurant = true
            }
        }
        if HasMatchedRestaurant == false {
            return "No matched founded"
        }
        else {
            let numberOfMatchedRestaurants = matchedRestaurants.count
            let IndexOfRestaurant = random(numberOfMatchedRestaurants)
            return matchedRestaurants[IndexOfRestaurant]
        }
    }
    
    func getLocation(location: String) -> String {
        HasMatchedRestaurant = false
        var matchedRestaurants = [String]()
        for size in 0..<getCount() {
            if location == restaurants[size].location {
                matchedRestaurants.append(restaurants[size].name!)
                HasMatchedRestaurant = true
            }
        }
        if HasMatchedRestaurant == false {
            return "No matched founded"
        }
        else {
            let numberOfMatchedRestaurants = matchedRestaurants.count
            let IndexOfRestaurant = random(numberOfMatchedRestaurants)
            return matchedRestaurants[IndexOfRestaurant]
        }
    }

}
