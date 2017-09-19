//
//  ViewController.swift
//  Demo iOS
//
//  Created by Hannes Oud on 04.09.17.
//  Copyright © 2017 IdeasOnCanvas GmbH. All rights reserved.
//

import Hekate
import StoreKit
import UIKit

class ViewController: UIViewController {

    private var receiptRefresher = ReceiptRefresher()
    private var viewModel = HekateDemoViewModel() {
        didSet {
            self.updateViewFromViewModel()
        }
    }
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var receiptDataTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewModel()
    }

    private func updateViewFromViewModel() {
        textView.text = self.viewModel.descriptionText
        receiptDataTextView.text = self.viewModel.receiptDataBase64Text
    }

    private func updateViewModel() {
        viewModel.update()
    }

    @IBAction func refreshReceiptFromStoreTapped() {
        receiptRefresher.refreshReceipt { error in
            self.viewModel.refreshError = error
            self.updateViewFromViewModel()
        }
    }
}
