import Foundation
import Photos

struct PhotoLibraryManager {
    var parentViewController: UIViewController?
    
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
    
    func requestAuthorizationOn() {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == PHAuthorizationStatus.denied {
            let alert = UIAlertController(title: "写真へのアクセスを許可", message: "写真へのアクセスを許可する必要があります。設定を変更してください。", preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: "設定変更", style: .default) { (_) in
                guard let _ = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
            }
            alert.addAction(settingsAction)
            alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: { (_) in
                return
            }))
            self.parentViewController?.present(alert, animated: true)
        }
    }
    
    func callPhotoLibrary() {
        requestAuthorizationOn()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let picker = UIImagePickerController()
            picker.modalPresentationStyle = UIModalPresentationStyle.popover
            picker.delegate = self.parentViewController as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            picker.sourceType = UIImagePickerController.SourceType.photoLibrary
            
            if let popover = picker.popoverPresentationController {
                popover.sourceView = self.parentViewController?.view
                popover.sourceRect = (self.parentViewController?.view.frame)!
                popover.permittedArrowDirections = UIPopoverArrowDirection.any
            }
            self.parentViewController?.present(picker, animated: true)
        }
    }
}
