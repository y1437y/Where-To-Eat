import UIKit

class ShowDiaryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Eat: UILabel!
    @IBOutlet weak var Like: UILabel!
    @IBOutlet weak var Dislike: UILabel!
    
    
    func decorate(with diary: Diary) {
        Name.translatesAutoresizingMaskIntoConstraints = false
        Date.translatesAutoresizingMaskIntoConstraints = false
        Eat.translatesAutoresizingMaskIntoConstraints = false
        Like.translatesAutoresizingMaskIntoConstraints = false
        Dislike.translatesAutoresizingMaskIntoConstraints = false
        Name.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        Name.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        Name.heightAnchor.constraint(equalToConstant: 20).isActive = true
        Name.textAlignment = .center
        
        Date.topAnchor.constraint(equalTo: Name.bottomAnchor).isActive = true
        Date.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        Date.heightAnchor.constraint(equalToConstant: 20).isActive = true
        Date.textAlignment = .center
        
        Eat.topAnchor.constraint(equalTo: Date.bottomAnchor).isActive = true
        Eat.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        Eat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        Eat.textAlignment = .center
        
        Like.topAnchor.constraint(equalTo: Eat.bottomAnchor).isActive = true
        Like.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        Like.heightAnchor.constraint(equalToConstant: 20).isActive = true
        Like.textAlignment = .center
        
        Dislike.topAnchor.constraint(equalTo: Like.bottomAnchor).isActive = true
        Dislike.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        Dislike.heightAnchor.constraint(equalToConstant: 20).isActive = true
        Dislike.textAlignment = .center
        
        Name.text = diary.name
        Date.text = diary.date
        Eat.text = "You ate \(diary.eat!)"
        Like.text = "You like \(diary.like!)"
        Dislike.text = "You don't like \(diary.unlike!)"
        
        Name.font = UIFont(name: "Marker Felt", size: 20)
        Date.font = UIFont(name: "Marker Felt", size: 20)
        Eat.font = UIFont(name: "Marker Felt", size: 20)
        Like.font = UIFont(name: "Marker Felt", size: 20)
        Dislike.font = UIFont(name: "Marker Felt", size: 20)
    }
}
