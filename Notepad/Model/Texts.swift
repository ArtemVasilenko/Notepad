
import Foundation

struct Note {
    
    var title: String
    var body: String
    
    init(title: String, body: String) {
        self.body = body
        self.title = title
    }
    
    
    //var notesArray: [Objects] = []
    
//    mutating func addNotes(_ title: String, _ body: String){
//        notesArray.append(Objects(title: title, body: body))
//    }
}

class ArrNotes {
    var arrNotes = [Note(title: "", body: "")]
}

//struct Objects {
//    var title: String
//    var body: String
//}
