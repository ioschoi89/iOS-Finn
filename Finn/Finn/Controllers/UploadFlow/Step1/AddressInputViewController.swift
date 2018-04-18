//
//  AddressInputViewController.swift
//  Finn
//
//  Created by choi hyunho on 2018. 4. 18..
//  Copyright © 2018년 Willicious-k. All rights reserved.
//

import UIKit

class AddressInputViewController: UIViewController {

  //MARK:- IBAction
  //MARK: removeKeyboard when tapped
  @IBAction func removeKeyboard(_ sender: Any) {
    inputCityTf.resignFirstResponder()
    inputAddressTf.resignFirstResponder()
  }
  //MARK:- IBOutlets
  @IBOutlet weak var goToMapBtn: UIButton!
  
  @IBOutlet weak var inputCityTf: UITextField!
  @IBOutlet weak var inputAddressTf: UITextField!
  
  //MARK:- Internal Property
  var houseInfoData: [String: Any] = [:]
  var addressForUpload: AddressForInternal = AddressForInternal()
  var tmpForMapSearch: String = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
      print(houseInfoData)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewDidLayoutSubviews() {
    inputAddressTf.borderBottom(height: 1.0, color: .lightGray)
    inputCityTf.borderBottom(height: 1.0, color: .lightGray)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let roomAddressVC = segue.destination as? RoomAddressViewController else {return}
    guard let tmpAddress = inputAddressTf.text else {return}
    roomAddressVC.tmpForMapSearch = tmpAddress
    
    roomAddressVC.houseInfoData = houseInfoData
    roomAddressVC.addressForUpload = addressForUpload
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AddressInputViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if inputCityTf.text == "" {
      inputCityTf.becomeFirstResponder()
    } else {
      inputCityTf.resignFirstResponder()
      inputAddressTf.becomeFirstResponder()
    } 
    return true
  }
}
