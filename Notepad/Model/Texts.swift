
import Foundation

struct Note {
    
    struct Objects {
        var title: String
        var body: String
    }
    
    var notesArray: [Objects] = []
    
    mutating func addNotes(_ title: String, _ body: String){
        notesArray.append(Objects(title: title, body: body))
    }
    
    
    
}

