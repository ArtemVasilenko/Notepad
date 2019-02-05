
import UIKit

class ViewController: UIViewController {
    var namesCell = Cell()
    var text = Texts()
    var boldIsOn = true
    
    func addNotes (_ name: String, _ body: String) {
        text.arrTexts[name] = body
    }
    
    @IBOutlet weak var boldButton: UIButton!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var bold3buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.delegate = self
        boldIsOn = false
        bold3buttonOutlet.setTitle("bold off", for: .normal)
        print(txtView)
        txtView.text = text.arrTexts[txtView.text]
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
    
    @IBAction func buttonSave(_ sender: UIButton) {
        
        addNotes(txtView.text, txtView.text)
        print(text.arrTexts)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tableVC = storyBoard.instantiateViewController(withIdentifier: "tableVC") as! ListTableViewController
        let navigationController = UINavigationController(rootViewController: tableVC)
        self.present(navigationController, animated: true, completion: nil)
        
        tableVC.namesCell = self.namesCell
        tableVC.text = self.text
        print(self.text.arrTexts)
        print(tableVC.text.arrTexts)
        
        namesCell.arrNamesCells.append(txtView.text)
        
    }
}

extension ViewController: UITextViewDelegate {
    
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
    
    
}

