import UIKit

extension UIViewController {
    
    // MARK: Standard alert box
    func messageBox(title: String, message: String, btText: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: btText, style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: Alert box with go to settings function
    func messageBox(title: String, message: String, btText: String, goToSettings: Bool){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if goToSettings{
            let settingsAction = UIAlertAction(title: "Settings", style: .default){ (_) -> Void in
                
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                
                if UIApplication.shared.canOpenURL(settingsUrl){
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)")
                    })
                }
                
            }
            alert.addAction(settingsAction)
        }
        
        alert.addAction(UIAlertAction(title: btText, style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
