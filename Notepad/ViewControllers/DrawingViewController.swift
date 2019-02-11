
import UIKit
class DrawingViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    //запоминает последнюю нарисованную точку на холсте. Используется, когда рисуется непрерывный мазок
    
    var red: CGFloat = 0.0
    //текущие значения RGB для выбранного цвета;
    
    var green: CGFloat = 0.0
    //текущие значения RGB для выбранного цвета;
    
    var blue: CGFloat = 0.0
    //текущие значения RGB для выбранного цвета;
    
    var brushWidth: CGFloat = 10.0
    //ширина
    
    var opacity: CGFloat = 1.0
    //прозрачность
    var swiped = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.swiped = false
        
        if let touch = touches.first{
            lastPoint = touch.location(in: self.view)
        }
    }
    //touchesBegan вызывается, когда пользователь ставит палец на экран. Это начало события рисования, поэтому сначала сбрасывается swiped на false, так как пока нет никакого движения. У вас также сохраняется локация прикосновения в lastPoint. Поэтому, когда пользователь начинает рисовать, двигая по экрану пальцем, вы можете отследить траекторию движения
    
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(brushWidth)
        context?.setStrokeColor(red: red, green: green, blue: blue, alpha: 1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        context?.strokePath()
        
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        UIGraphicsEndImageContext()
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !swiped {
            drawLineFrom(fromPoint: lastPoint, toPoint: lastPoint)
        }
        
        UIGraphicsBeginImageContext(mainImageView.frame.size)
        
        mainImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .normal, alpha: 1.0)
        
        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height), blendMode: .normal, alpha: opacity)
        
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        tempImageView.image = nil
    }
}
