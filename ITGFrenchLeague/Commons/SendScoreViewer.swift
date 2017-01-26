//
//  SendScoreViewer.swift
//  ITGFrenchLeague
//
//  Created by Francois JUTEAU on 30/12/2016.
//  Copyright © 2016 Fjuteau. All rights reserved.
//

import UIKit
import MessageUI

class SendScoreViewer: UIViewController {
  
  var sendScoreView: SendScoreView {
    
    return view as! SendScoreView
  }
  
  var songPickerView: SongPickerView?
  
  var pickerData: [Song] {
    
    guard let data = DataRetainer.songs else { return [Song]() }
    
    return data
  }
  
  
  // Data to send
  var pseudoToSubmit: String?
  var songToSubmitTitle: String?
  var scoreToSubmit: String?
  var screenshotImage: UIImage?
  
  
  // MARK: Methods
  
  override func viewDidLoad() {
    
    songPickerView = SongPickerView(frame: CGRect(x: 0, y: self.view.frame.height - 320, width: self.view.frame.width, height: 320))
    songPickerView?.pickerView.delegate = self
    songPickerView?.pickerView.dataSource = self
    songPickerView?.submitButton.addTarget(self, action: #selector(didTapSongPickerDismissButton), for: .touchUpInside)
    
    sendScoreView.playerNameTextFieldView.textField.delegate = self
    sendScoreView.scoreTextFieldView.textField.delegate = self
    
    sendScoreView.submitButton.addTarget(self, action: #selector(sendEmailButtonTapped), for: .touchUpInside)
  }
  
  
  func updateSubmitButtonAvailability() {
    
    guard let _ = screenshotImage,
      let _ = songToSubmitTitle,
      let _ = pseudoToSubmit else { return }
      
    sendScoreView.submitButton.isEnabled = true
  }
  
  
  // MARK: Actions
  
  @IBAction func openPhotoLibraryButton(sender: UIButton) {
    
    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .photoLibrary;
      imagePicker.allowsEditing = true
      self.present(imagePicker, animated: true, completion: nil)
    }
  }
  
  
  @IBAction func selectSongButton(sender: UIButton) {
    
    guard let picker = songPickerView else {  return  }
    
    self.view.endEditing(true)
    self.view.addSubview(picker)
  }
  
  
  func didTapSongPickerDismissButton(sender: UIButton) {
    
    guard let picker = songPickerView else {  return  }
    
    picker.removeFromSuperview()
  }
  
}

extension SendScoreViewer: UITextFieldDelegate {
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    switch textField.tag {
    case SendScoreViewConstants.playerNameTextFieldViewTag:
      pseudoToSubmit = textField.text
      
    case SendScoreViewConstants.scoreTextFieldViewTag:
      scoreToSubmit = textField.text
      
    default: break
    }
    updateSubmitButtonAvailability()
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    return true
  }
}

extension SendScoreViewer: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
    return pickerData.count
  }
}

extension SendScoreViewer: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
    
    let attributes = [NSForegroundColorAttributeName: UIColor.mainText,
                      NSFontAttributeName: UIFont.main(with: 20)] as [String : Any]
    return NSAttributedString(string: pickerData[row].title, attributes: attributes)
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    songToSubmitTitle = pickerData[row].title
    self.sendScoreView.submitSongButton.setTitle(songToSubmitTitle, for: .normal)
    updateSubmitButtonAvailability()
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

extension SendScoreViewer: MFMailComposeViewControllerDelegate {
  
  @IBAction func sendEmailButtonTapped(sender: AnyObject) {
    let mailComposeViewController = configuredMailComposeViewController()
    if MFMailComposeViewController.canSendMail() {
      self.present(mailComposeViewController, animated: true, completion: nil)
    } else {
      self.showSendMailErrorAlert()
    }
  }
  
  func configuredMailComposeViewController() -> MFMailComposeViewController {
    let mailComposerVC = MFMailComposeViewController()
    mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
    
    if let pseudoToSubmit = pseudoToSubmit,
      let songToSubmitTitle = songToSubmitTitle,
      let screenshotImage = screenshotImage,
      let screenData = UIImageJPEGRepresentation(screenshotImage, 1) {
      
      mailComposerVC.setToRecipients(["itgfrenchleague@gmail.com"])
      mailComposerVC.setSubject("ITG French League - \(pseudoToSubmit) - \(songToSubmitTitle) - \(scoreToSubmit)")
      mailComposerVC.setMessageBody("\(pseudoToSubmit) - \(songToSubmitTitle) - \(scoreToSubmit)", isHTML: false)
      mailComposerVC.addAttachmentData(screenData, mimeType: "image/jpeg", fileName: "score")
    }
    
    return mailComposerVC
  }
  
  func showSendMailErrorAlert() {
//    let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
//    sendMailErrorAlert.show()
  }
  
  // MARK: MFMailComposeViewControllerDelegate
  
  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    
    controller.dismiss(animated: true, completion: nil)
  }
}
