
protocol NoteProtocol {
    func reloadArrayNotes (notes: Note)
}

extension NoteProtocol {
    func reloadArrayNotes (notes: Note) {
        ArrNotes.arrNotes.append(notes)
    }
    
}
