import Foundation


class Note {
    var title: String
    var body: String
    
    init(title: String, body: String) {
        self.body = body
        self.title = title
    }
}
struct ArrNotes {
    var arrNotes = [Note]()
}


