//
//  ViewController.swift
//  ToolBarinTextField
//
//  Created by Hong Cheng Yen on 2021/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TextFieldCollection: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        addToolBarOnKeyboard()
    }
    
    func addToolBarOnKeyboard() {
        
        for (index, TextField) in TextFieldCollection.enumerated() {
            //ToolBar 製作
            let ToolBar = UIToolbar()
            ToolBar.sizeToFit()
            //製作 previous 按鍵
            let previousButton = UIBarButtonItem(image: UIImage(systemName: "chevron.up"), style: .plain, target: nil, action: nil)
            //製作 next 按鍵
            let nextButton = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .plain, target: nil, action: nil)
            //製作 Done 按鍵
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(closekeyboard))
            //製作 空白 按鍵
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            ToolBar.setItems([previousButton, nextButton, flexibleSpace, doneButton], animated: true)
            TextField.inputAccessoryView = ToolBar
            
            //判斷是否為第一個 TextField
            if TextField == TextFieldCollection.first {
                //關閉 previous 按鍵
                previousButton.isEnabled = false
            }else {
                previousButton.target = TextFieldCollection[index - 1]
                previousButton.action = #selector(TextField.becomeFirstResponder)
            }
            
            //判斷是否為最後一個 TextField
            if TextField == TextFieldCollection.last {
                //關閉 next 按鍵
                nextButton.isEnabled = false
            }else {
                nextButton.target = TextFieldCollection[index + 1]
                nextButton.action = #selector(TextField.becomeFirstResponder)
            }
        }
        
        
    }
    
    //收鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //done 收鍵盤
    @objc func closekeyboard() {
        view.endEditing(true)
    }


}

