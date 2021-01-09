//
//  FileViewController.swift
//  DanDanPlayForiOS
//
//  Created by JeffersonQin on 2021/1/9.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class FileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            return self.tableView.dequeueReusableCell(withIdentifier: "picker_test") ?? UITableViewCell.init()
        }
        if (indexPath.section == 1) {
            return self.tableView.dequeueReusableCell(withIdentifier: "player_test") ?? UITableViewCell.init()
        }
        return UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "File"
        case 1:
            return "Player"
        default:
            return nil
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            let importMenu = UIDocumentPickerViewController.init(documentTypes: [], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
            break
        case 1:
            
            break
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: UIDocumentPicker
extension FileViewController: UIDocumentMenuDelegate, UIDocumentPickerDelegate {
    
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        self.present(documentPicker, animated: true, completion: nil)
        
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        
        
       // dismiss(animated: true, completion: nil)
        
    }
    
}
