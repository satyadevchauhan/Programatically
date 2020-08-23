//
//  ItemTableViewCell.swift
//  Programmatically
//
//  Created by Satyadev Chauhan on 22/08/20.
//  Copyright © 2020 Satyadev Chauhan. All rights reserved.
//

import UIKit
import SnapKit

class ItemTableViewCell: UITableViewCell {
    
    static let reuseId = String(describing: self)
    
    fileprivate let idLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Id: ".localized
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    fileprivate let idValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.italicSystemFont(ofSize: 16)
        return lbl
    }()
    
    fileprivate let typeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Type: ".localized
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    fileprivate let typeValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.italicSystemFont(ofSize: 16)
        return lbl
    }()
    
    fileprivate let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Date: ".localized
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    fileprivate let dateValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.italicSystemFont(ofSize: 16)
        return lbl
    }()
    
    fileprivate let dataLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Data: ".localized
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    fileprivate let dataValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.italicSystemFont(ofSize: 16)
        return lbl
    }()
    
    var model: ItemModel? {
        didSet {
            idValueLabel.text = model?.id
            typeValueLabel.text = model?.type
            dateValueLabel.text = model?.date
            dataValueLabel.text = model?.data
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization codes
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup

extension ItemTableViewCell {
    
    fileprivate func setupViews() {
        
        selectionStyle = .none
        
        contentView.addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(16.0)
            make.width.equalTo(60)
            make.top.equalTo(contentView).offset(8.0)
        }
        
        contentView.addSubview(idValueLabel)
        idValueLabel.snp.makeConstraints { make in
            make.leading.equalTo(idLabel.snp.trailing).offset(8.0)
            make.trailing.equalTo(contentView).offset(-16.0)
            make.centerY.equalTo(idLabel)
        }
        
        contentView.addSubview(typeLabel)
        typeLabel.snp.makeConstraints { make in
            make.leading.equalTo(idLabel)
            make.width.equalTo(60)
            make.top.equalTo(idLabel.snp.bottom).offset(8.0)
        }
        
        contentView.addSubview(typeValueLabel)
        typeValueLabel.snp.makeConstraints { make in
            make.leading.equalTo(typeLabel.snp.trailing).offset(8.0)
            make.trailing.equalTo(contentView).offset(-16.0)
            make.centerY.equalTo(typeLabel)
        }
        
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(typeLabel)
            make.width.equalTo(60)
            make.top.equalTo(typeLabel.snp.bottom).offset(8.0)
        }
        
        contentView.addSubview(dateValueLabel)
        dateValueLabel.snp.makeConstraints { make in
            make.leading.equalTo(dateLabel.snp.trailing).offset(8.0)
            make.trailing.equalTo(contentView).offset(-16.0)
            make.centerY.equalTo(dateLabel)
        }
        
        contentView.addSubview(dataLabel)
        dataLabel.snp.makeConstraints { make in
            make.leading.equalTo(dateLabel)
            make.width.equalTo(60)
            make.top.equalTo(dateLabel.snp.bottom).offset(8.0)
            make.bottom.equalToSuperview().offset(-8.0)
        }
        
        contentView.addSubview(dataValueLabel)
        dataValueLabel.snp.makeConstraints { make in
            make.leading.equalTo(dataLabel.snp.trailing).offset(8.0)
            make.trailing.equalTo(contentView).offset(-16.0)
            make.centerY.equalTo(dataLabel)
        }
    }

}
