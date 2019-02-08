
import UIKit

class ViewController: UIViewController {
    var boldIsOn = true
    var note: Note!
    
    @IBOutlet weak var boldButton: UIButton!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var bold3buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtView.text = note.body
        txtView.delegate = self
        boldIsOn = false
        bold3buttonOutlet.setTitle("bold off", for: .normal)
    }
    
    
    @IBAction func bold3(_ sender: UIButton) {
        if boldIsOn == false {
            boldIsOn = true
            bold3buttonOutlet.setTitle("bold on", for: .normal)
            self.txtView.font = UIFont.boldSystemFont(ofSize: 16)
            print("bold on")
        } else {
            boldIsOn = false
            bold3buttonOutlet.setTitle("bold off", for: .normal)
            self.txtView.font = UIFont.systemFont(ofSize: 16)
            print("bold off")
        }
    }
    
    //        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //            if segue.identifier == "moveToTV" {
    //
    //
    //                let tableVC = segue.destination as! ListTableViewController
    //
    //                let firstWord = txtView.text.components(separatedBy: " ").first
    //                print(firstWord!)
    //
    //                note.addNotes(firstWord!, self.txtView.text!)
    //                print(note.notesArray)
    //
    //                self.note.notesArray = tableVC.nameCell.notesArray
    //
    //
    //            }
    //        }
    
    
    
    @IBAction func buttonSave(_ sender: UIButton) {
        
        //        let firstWord = txtView.text.components(separatedBy: " ").first
        //
        //        note.addNotes(firstWord!, self.txtView.text!)
        //        print(note.notesArray)
        
        
        //        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //        let tableVC = storyBoard.instantiateViewController(withIdentifier: "tableVC") as! ListTableViewController
        //        self.present(tableVC, animated: true, completion: nil)
        //        tableVC.nameCell = self.note
        
        
        //        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //        let tableVC = storyBoard.instantiateViewController(withIdentifier: "tableVC") as! ListTableViewController
        //        let navigationController = UINavigationController(rootViewController: tableVC)
        //        self.present(navigationController, animated: true, completion: nil)
        //        tableVC.nameCell = self.note
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let firstWord = txtView.text.components(separatedBy: " ").first
        note = Note(title: firstWord ?? "", body: textView.text)
//        note.title = firstWord ?? ""
//        note.body = txtView.text
        print(note.body)
        
    }
    
}

//    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
//
//        if boldIsOn == true {
//            self.txtView.font = UIFont.boldSystemFont(ofSize: 16)
//        } else {
//            self.txtView.font = UIFont.systemFont(ofSize: 16)
//        }
//
//        return true
//    }

//        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//            if boldIsOn == true {
//                self.txtView.font = UIFont.boldSystemFont(ofSize: 16)
//            } else {
//                self.txtView.font = UIFont.systemFont(ofSize: 16)
//            }
//
//            return true
//        } // меняет всё

//    func textViewDidChange(_ textView: UITextView) {
//        for i in txtView.text {
//            if boldIsOn == true {
//                print(i)
//            i.font = UIFont.boldSystemFont(ofSize: 16)
//        } else {
//            //String(i).font = UIFont.systemFont(ofSize: 16)
//        }
//        }
//    }




