//
//  SettingViewController.swift
//  iOS_Sample
//
//  Created by KNobuhara on 6/5/4 R.
//  Copyright © 4 Reiwa KNobuhara. All rights reserved.
//
import UIKit
import Foundation

class SettingViewController: UIViewController {
    @IBOutlet weak var _dateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func updateString (_ date: String) {
        _dateLabel.text = date + "の設定を行います！"
    }

    @IBAction private func tapButton(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "戻る":
            self.dismiss(animated: true, completion: nil)
            break
        default:
            break
        }
    }
}
