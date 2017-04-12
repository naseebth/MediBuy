//
//  ViewController.swift
//  MediBuy
//
//  Created by Ashmita Bohara on 4/5/17.
//  Copyright © 2017 Slanted Lines. All rights reserved.
//

import UIKit

class FeaturedProductsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    private let cellId = "cellId"
    
    var productCategories: [ProductCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCategories = ProductCategory.sampleProductCategories()
        
        collectionView?.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    
        navigationItem.title = "MediBuy"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.text = "MediBuy"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        
       setupNavBarButtons()
    
    }
    
    
    func setupNavBarButtons() {
        
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
    
        
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let cartImage = UIImage(named: "cart_icon")?.withRenderingMode(.alwaysOriginal)
        
        
        let cartBarButtonItem = UIBarButtonItem(image: cartImage, style: .plain, target: self, action: #selector(handleCart))
        
        let menuImage = UIImage(named: "menu_icon")?.withRenderingMode(.alwaysOriginal)
        
        
        let menuBarButtonItem = UIBarButtonItem(image: menuImage, style: .plain, target: self, action: #selector(handleMenu))
        
   navigationItem.rightBarButtonItems = [cartBarButtonItem, searchBarButtonItem]
        
   navigationItem.leftBarButtonItems = [menuBarButtonItem]
    }
    
    func handleSearch() {
        print(123)
    }
    func handleCart(){
        
    }

    func  handleMenu() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
     cell.productCategory = productCategories?[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
         return CGSize(width: view.frame.width, height: 230)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = productCategories?.count{
            return count
        }
        return 0
    }
}



