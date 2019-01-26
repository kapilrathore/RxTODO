//
//  ViewController.swift
//  RxSample
//
//  Created by Kapil Rathore on 06/02/18.
//  Copyright © 2018 Kapil Rathore. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private enum ColorScheme: Int {
        
        case white
        case black
        
        private var blackColor: UIColor {
            return #colorLiteral(red: 0.180380143, green: 0.182166085, blue: 0.182166085, alpha: 1)
        }
        private var whiteColor: UIColor {
            return #colorLiteral(red: 0.9345653553, green: 0.9345653553, blue: 0.9345653553, alpha: 1)
        }
        
        var textColor: UIColor {
            switch self {
            case .white:
                return blackColor
            case .black:
                return whiteColor
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .white:
                return whiteColor
            case .black:
                return blackColor
            }
        }
    }
    
    @IBOutlet private weak var colorSegment: UISegmentedControl!
    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var quoteLabel: UILabel!
    @IBOutlet private weak var quoteTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteTextField.rx.text.asObservable().bind(to: quoteLabel.rx.text).disposed(by: disposeBag)
        
        colorSegment.rx.selectedSegmentIndex.asObservable().map { (index) -> UIColor in
                return ColorScheme(rawValue: index)!.backgroundColor
            }.subscribe(onNext: { [weak self] (color) in
                self?.backView.backgroundColor = color
            }).disposed(by: disposeBag)
        
        colorSegment.rx.selectedSegmentIndex.asObservable().map { (index) -> UIColor in
            return ColorScheme(rawValue: index)!.textColor
            }.subscribe(onNext: { [weak self] (color) in
                self?.quoteLabel.textColor = color
            }).disposed(by: disposeBag)
    }
}
