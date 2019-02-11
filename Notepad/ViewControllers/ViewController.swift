
import UIKit

class ViewController: UIViewController {
    var boldIsOn = true
    var note: Note!
    
    @IBOutlet weak var boldButton: UIButton!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var bold3buttonOutlet: UIButton!
    
    let boldOff = UIImage(named: "boldOff")
    let boldOn = UIImage(named: "boldOn")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtView.text = note.body
        self.txtView.delegate = self
        self.boldIsOn = false
        self.bold3buttonOutlet.setImage(boldOff, for: .normal)
        
        NotificationCenter.default.addObserver(self, selector: #selector (updateTextView), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector (updateTextView), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func updateTextView (param: Notification) {
        let userInfo = param.userInfo
        let keyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardFrame = self.view.convert(keyboardRect, to: view.window)
        
        if param.name == UIResponder.keyboardWillHideNotification {
            txtView.contentInset = UIEdgeInsets.zero
        } else {
            txtView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            txtView.scrollIndicatorInsets = txtView.contentInset
        }
        
        txtView.scrollRangeToVisible(txtView.selectedRange)
    }
    
    fileprivate func bold() {
        if boldIsOn == false {
            boldIsOn = true
            self.bold3buttonOutlet.setImage(boldOn, for: .normal)
            self.txtView.font = UIFont.boldSystemFont(ofSize: 14)
            print("bold on")
        } else {
            boldIsOn = false
            self.bold3buttonOutlet.setImage(boldOff, for: .normal)
            self.txtView.font = UIFont.systemFont(ofSize: 14)
            print("bold off")
        }
    }
    
    @IBAction func boldButton(_ sender: UIButton) {
        bold()
    }
    
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        note.body = txtView.text
        note.title = txtView.text.components(separatedBy: " ").first ?? ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        print("touchBegan")
    }
}





