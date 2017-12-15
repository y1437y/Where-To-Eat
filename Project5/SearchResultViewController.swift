import UIKit

class SearchResultViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    let model = RestaurantModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.showsCancelButton = false
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let goingToSearch = searchBar.text else { return }
        let URLToPresent = model.getSearchString(userSearch: goingToSearch)
        
        let googleSearchURLRequest = URLRequest(url: URLToPresent)
        webView.loadRequest(googleSearchURLRequest)
    }
    @IBAction func ForwardButtonTapped(_ sender: UIButton) {
        if (webView.canGoForward) {
            webView.goForward()
        }
    }

    @IBAction func BackButtonTapped(_ sender: UIButton) {
        if (webView.canGoBack) {
            webView.goBack()
        }
    }
}
