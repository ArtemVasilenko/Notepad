
import UIKit

class ListTableViewController: UITableViewController {
    
    var nameCell = [Note]()
    var notes = ArrNotes()
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.arrNotes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = notes.arrNotes[indexPath.row].title
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let path = tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ViewController
                vc.note = notes.arrNotes[path.row]
            }
        } else if segue.identifier == "addNewCell" {
            let vc = segue.destination as! ViewController
            vc.note = Note(title: "cell", body: "yo")
            notes.arrNotes.append(vc.note)
        }
    }
    
}
