//
//  CustomToast.swift
//  CatalogApp
//
//  Created by Maulana Frasha on 10/11/23.
//

import UIKit

class CustomToast {

    enum Position {
        case top
        case bottom
    }

    static func show(
        message: String,
        bgColor: UIColor,
        textColor: UIColor = .white,
        labelFont: UIFont = .systemFont(ofSize: 17),
        showIn: Position = .bottom,
        controller: UIViewController) {
        for item in controller.view.subviews {
            if item.tag == 12212121212121 {
                item.removeFromSuperview()
            }
        }

        let toastView = UIView(frame: CGRect())
        toastView.backgroundColor = bgColor
        toastView.alpha = 0.0
        toastView.layer.cornerRadius = 15
        toastView.clipsToBounds = true

        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = textColor
        toastLabel.textAlignment = .center
        toastLabel.font = labelFont
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        toastView.tag = 12212121212121
        toastView.addSubview(toastLabel)
        controller.view.addSubview(toastView)

        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastView.translatesAutoresizingMaskIntoConstraints = false

        let lblConstraint1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastView, attribute: .leading, multiplier: 1, constant: 10)
        let lblConstraint2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastView, attribute: .trailing, multiplier: 1, constant: -10)
        let lblConstraint3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastView, attribute: .bottom, multiplier: 1, constant: -10)
        let lblConstraint4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastView, attribute: .top, multiplier: 1, constant: 10)

        toastView.addConstraints([lblConstraint1,lblConstraint2,lblConstraint3,lblConstraint4])

        let toastViewC1 = NSLayoutConstraint(item: toastView, attribute: .leading, relatedBy: .equal, toItem: controller.view, attribute: .leading, multiplier: 1, constant: 16)
        let toastViewC2 = NSLayoutConstraint(item: toastView, attribute: .trailing, relatedBy: .equal, toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -16)
        let toastViewC3 = NSLayoutConstraint(item: toastView, attribute: (showIn == .top) ? .top : .bottom, relatedBy: .equal, toItem: controller.view, attribute: (showIn == .top) ? .top : .bottom, multiplier: 1, constant: (showIn == .top) ? controller.view.safeAreaInsets.top + 16 : -(controller.view.safeAreaInsets.bottom + 16))

        controller.view.addConstraints([toastViewC1,toastViewC2,toastViewC3])

        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastView.alpha = 1.0
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastView.alpha = 0.0
            }) { (_) in
                toastView.removeFromSuperview()
            }
        }
    }
}
