import UIKit
import Foundation

var diary: [Diary] = []


class DiaryModel {
    func getCount() -> Int {
        return diary.count
    }
    
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            diary = try context.fetch(Diary.fetchRequest())
        }
        catch {
            print("Fatching error")
        }
    }
}

