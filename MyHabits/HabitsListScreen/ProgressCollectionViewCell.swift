//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Vadim on 14.04.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        contentView.addSubview(view)
        view.toAutoLayout()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.progressViewStyle = .bar
        view.setProgress(0.49, animated: false)
        view.tintColor = .purpleColor
        view.trackTintColor = .progressBackgroundColor
        view.center = contentView.center
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.toAutoLayout()
        contentView.addSubview(view)
        return view
    }()
    
    private lazy var workOutLabel: UILabel = {
        let label = UILabel()
        label.text = "Всё получится!"
        label.font = UIFont(name: "SFProText-Semibold", size: 13)
        label.textColor = .systemGrayColor
        label.toAutoLayout()
        contentView.addSubview(label)
        return label
    }()
    
    private lazy var percentLabel: UILabel = {
        var label = UILabel()
        label.text = "100%"
        label.font = UIFont(name: "SFProText-Semibold", size: 13)
        label.textColor = .systemGrayColor
        label.toAutoLayout()
        contentView.addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .lightGrayColor
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12),
            
            progressView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            progressView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15),
            progressView.heightAnchor.constraint(equalToConstant: 7),
            
            workOutLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            workOutLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            
            percentLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            percentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12)
        ])
    }
}

