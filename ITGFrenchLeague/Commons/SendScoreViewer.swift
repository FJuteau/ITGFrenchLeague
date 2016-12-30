//
//  SendScoreViewer.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 30/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit

class SendScoreViewer: UIViewController {
  
  var sendScoreView: SendScoreView {
    return view as! SendScoreView
  }
  
  var screenshotImage: UIImage?
  
  
  func updateSubmitButtonAvailability() {
    
    guard let _ = screenshotImage else { return }
      
    sendScoreView.submitButton.isEnabled = true
  }
  
  @IBAction func openPhotoLibraryButton(sender: AnyObject) {
    
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .photoLibrary;
      imagePicker.allowsEditing = true
      self.present(imagePicker, animated: true, completion: nil)
    }
  }
}

extension SendScoreViewer: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    if let image = info["UIImagePickerControllerEditedImage"] as? UIImage {
      screenshotImage = image
    }
    self.dismiss(animated: true, completion: nil)
    updateSubmitButtonAvailability()
  }
}
