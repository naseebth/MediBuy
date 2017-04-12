//
//  CategoryCell.swift
//  MediBuy
//
//  Created by Ashmita Bohara on 4/7/17.
//  Copyright © 2017 Slanted Lines. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var productCategory: ProductCategory? {
        didSet {
            
            if let name = productCategory?.name {
                nameLabel.text = name
            }
            
            productsCollectionView.reloadData()
            
        }
    }
    
    
    private let cellId = "appCellId"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Best New Books"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewButton: UIButton = {
        let viewButton1 = UIButton()
        viewButton1.setTitle("View All",for: .normal)
        viewButton1.setTitleColor(UIColor.black, for: .normal)
        viewButton1.backgroundColor = UIColor.clear
        viewButton1.sizeToFit()
        return viewButton1
    }()
    
    let productsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
    view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
  
    
    func setupViews() {
        backgroundColor = UIColor.clear
        
        addSubview(productsCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)
        addSubview(viewButton)
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
    
        productsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": dividerLineView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": productsCollectionView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": productsCollectionView, "v1":dividerLineView, "nameLabel": nameLabel]))
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = productCategory?.products?.count {
            return count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppCell
        cell.product = productCategory?.products?[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 50)
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
}

class AppCell: UICollectionViewCell {
    var product: Product? {
        didSet {
            if let name = product?.name {
                nameLabel.text = name
                
                let rect = NSString(string: name).boundingRect(with: CGSize(width: frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if rect.height > 20 {
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 38, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
                } else {
                    categoryLabel.frame = CGRect(x: 0, y: frame.width + 22, width: frame.width, height: 20)
                    priceLabel.frame = CGRect(x: 0, y: frame.width + 40, width: frame.width, height: 20)
                }
                
                nameLabel.frame = CGRect(x: 0, y: frame.width + 5, width: frame.width, height: 40)
                nameLabel.sizeToFit()
                
            }
            
            categoryLabel.text = product?.category
            
            if let price = product?.price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = ""
            }
            
            if let imageName = product?.imageName {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 8
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Medical Book 1"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let viewButton: UIButton = {
        let viewButton1 = UIButton()
        viewButton1.setTitle("View All",for: .normal)
        viewButton1.setTitleColor(UIColor.black, for: .normal)
        viewButton1.backgroundColor = UIColor.clear
        viewButton1.sizeToFit()
        
        return viewButton1
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Books"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "2000"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
    
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
        categoryLabel.frame = CGRect(x: 0, y: frame.width + 38, width: frame.width, height: 20)
        priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
   
    }
    
}

