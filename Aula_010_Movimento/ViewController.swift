
import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    //MARK: Outlets - Label
    @IBOutlet weak var labelX: UILabel!
    @IBOutlet weak var labelY: UILabel!
    @IBOutlet weak var labelZ: UILabel!
    
    @IBOutlet weak var labelRoll: UILabel!
    @IBOutlet weak var labelYaw: UILabel!
    @IBOutlet weak var labelPitch: UILabel!
    
    
    //MARK: Outlets - ProgressView
    @IBOutlet weak var progressX: UIProgressView!
    @IBOutlet weak var progressY: UIProgressView!
    @IBOutlet weak var progressZ: UIProgressView!
    
    @IBOutlet weak var progressRoll: UIProgressView!
    @IBOutlet weak var progressYaw: UIProgressView!
    @IBOutlet weak var progressPitch: UIProgressView!
    
    //MARK: Propriedades
    let gerenciadorSensores = CMMotionManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Actions
    @IBAction func iniciar(_ sender: UIButton) {
        
        //Acelerômetro
        if gerenciadorSensores.isAccelerometerAvailable {
            
            gerenciadorSensores.accelerometerUpdateInterval = 0.01
            
            gerenciadorSensores.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                
                self.labelX.text = "\(data!.acceleration.x)"
                self.labelY.text = "\(data!.acceleration.y)"
                self.labelZ.text = "\(data!.acceleration.z)"
                
                self.progressX.progress = Float(data!.acceleration.x)
                self.progressY.progress = Float(data!.acceleration.y)
                self.progressZ.progress = Float(data!.acceleration.z)
            
            })
        }
        
        //Giroscópio
        if gerenciadorSensores.isGyroAvailable {
            
            gerenciadorSensores.deviceMotionUpdateInterval = 0.01
            
            gerenciadorSensores.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                
                self.labelRoll.text = "\(data!.attitude.roll)"
                self.labelYaw.text = "\(data!.attitude.yaw)"
                self.labelPitch.text = "\(data!.attitude.pitch)"
                
                self.progressRoll.progress = Float(data!.attitude.roll)
                self.progressYaw.progress = Float(data!.attitude.yaw)
                self.progressPitch.progress = Float(data!.attitude.pitch)
                
            })
        }
    }



}

