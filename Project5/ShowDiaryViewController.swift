import UIKit

class ShowDiaryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var ColorChangeBtn: UIButton!
    let model = DiaryModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ColorChangeBtn.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        ColorChangeBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        ColorChangeBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        ColorChangeBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        ColorChangeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        collectionView.topAnchor.constraint(equalTo: ColorChangeBtn.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        collectionView.dataSource = self
        self.view.backgroundColor = UIColor(red: 0.95, green: 0.93, blue: 0.87, alpha: 1)
        self.collectionView.backgroundColor = UIColor(red: 0.95, green: 0.93, blue: 0.87, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        model.getData()
        collectionView.reloadData()
    }
    
    @IBAction func ColorChangeTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations:  {
            self.view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
            self.collectionView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        }, completion: nil)
    }
    
}

extension ShowDiaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showDiaryCell",
                                                     for: indexPath) as? ShowDiaryCollectionViewCell
            else { return UICollectionViewCell() }
        let diaryToShow = diary[indexPath.row]
        cell.decorate(with: diaryToShow)
        return cell
    }
    
}

