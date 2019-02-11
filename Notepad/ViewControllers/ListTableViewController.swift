
import UIKit

class ListTableViewController: UITableViewController, NoteProtocol {
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrNotes.arrNotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = ArrNotes.arrNotes[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("deleted")
            
            ArrNotes.arrNotes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let path = tableView.indexPathForSelectedRow {
                let vc = segue.destination as! ViewController
                vc.note = ArrNotes.arrNotes[path.row]
            }
        } else if segue.identifier == "addNewCell" {
            let vc = segue.destination as! ViewController
            vc.note = Note(title: "", body: "")
            reloadArrayNotes(notes: vc.note)
        }
    }
}
