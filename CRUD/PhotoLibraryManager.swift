import Foundation
import Photos

struct PhotoLibraryManager {
    let parentViewController: UIViewController?
    
    init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
    
    func requestAuthorizationOn() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .denied:
            let alert = UIAlertController(title: R.string.setting.canAccessToCamera(), message: R.string.setting.pleaseChangeSettings(), preferredStyle: .alert)
            let settingsAction = UIAlertAction(title: R.string.setting.changeSettings(), style: .default) { (_) in
                guard let _ = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
            }
            alert.addAction(settingsAction)
            alert.addAction(UIAlertAction(title: R.string.setting.cancel(), style: .cancel, handler: { (_) in
                return
            }))
            parentViewController?.present(alert, animated: true)
        case .notDetermined:
            break
        case .restricted:
            break
        case .authorized:
            break
        }
    }
    
    func callPhotoLibrary() {
        requestAuthorizationOn()
        guard  UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) else { return }
            let picker = UIImagePickerController()
            picker.modalPresentationStyle = UIModalPresentationStyle.popover
            picker.delegate = parentViewController as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        guard let popover = picker.popoverPresentationController else { return }
            popover.sourceView = parentViewController?.view
            popover.sourceRect = (parentViewController?.view.frame)!
            popover.permittedArrowDirections = UIPopoverArrowDirection.any
            parentViewController?.present(picker, animated: true)
    }
}
