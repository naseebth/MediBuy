//
//  Models.swift
//  MediBuy
//
//  Created by Ashmita Bohara on 4/8/17.
//  Copyright © 2017 Slanted Lines. All rights reserved.
//

import UIKit

class ProductCategory: NSObject {
    
    var name: String?
    
    var products: [Product]?
    static func sampleProductCategories() -> [ProductCategory] {
            
            let bestNewBooksCategory = ProductCategory()
            bestNewBooksCategory.name = "Best New Books"
            
            var books = [Product]()
            
            // logic
            let MedicalBook1 = Product()
            MedicalBook1.name = "Medical Book 1"
            MedicalBook1.imageName = "book1"
            MedicalBook1.category = "Books"
            MedicalBook1.price = NSNumber(value: 1000 as Float)
            books.append(MedicalBook1)
            
            bestNewBooksCategory.products = books
        
        let MedicalBook3 = Product()
        MedicalBook3.name = "Medical Book 3"
        MedicalBook3.imageName = "book3"
        MedicalBook3.category = "Books"
        MedicalBook3.price = NSNumber(value: 1000 as Float)
        books.append(MedicalBook3)
        
        bestNewBooksCategory.products = books
        
        let MedicalBook2 = Product()
        MedicalBook2.name = "Medical Book 2"
        MedicalBook2.imageName = "book2"
        MedicalBook2.category = "Books"
        MedicalBook2.price = NSNumber(value: 1000 as Float)
        books.append(MedicalBook2)
        
        bestNewBooksCategory.products = books
        
        let MedicalBook4 = Product()
        MedicalBook4.name = "Medical Book 4"
        MedicalBook4.imageName = "book4"
        MedicalBook4.category = "Books"
        MedicalBook4.price = NSNumber(value: 1000 as Float)
        books.append(MedicalBook4)
        
        bestNewBooksCategory.products = books
        
        let MedicalBook6 = Product()
        MedicalBook6.name = "Medical Book 4"
        MedicalBook6.imageName = "book5"
        MedicalBook6.category = "Books"
        MedicalBook6.price = NSNumber(value: 1000 as Float)
        books.append(MedicalBook6)
        
        bestNewBooksCategory.products = books
        
        let MedicalBook5 = Product()
        MedicalBook5.name = "Medical Book 4"
        MedicalBook5.imageName = "book6"
        MedicalBook5.category = "Books"
        MedicalBook5.price = NSNumber(value: 1000 as Float)
        books.append(MedicalBook5)
        
        bestNewBooksCategory.products = books
        
        
        let bestNewEquipmentsCategory = ProductCategory()
        bestNewEquipmentsCategory.name = "Best New Equiments"
        
        var equipments = [Product]()
        
        let equipment1 = Product()
        equipment1.name = "stethoscope"
        equipment1.category = "Equipments"
        equipment1.imageName = "stethoscope"
        equipment1.price = NSNumber(value: 2000 as Float)
        
        equipments.append(equipment1)
        
        bestNewEquipmentsCategory.products = equipments
        
        let equipment2 = Product()
        equipment2.name = "BPmeasuement"
        equipment2.category = "Equipments"
        equipment2.imageName = "bpmeasurement"
        equipment2.price = NSNumber(value: 2000 as Float)
        
        equipments.append(equipment2)
        
        bestNewEquipmentsCategory.products = equipments
        
        equipments.append(equipment2)
        
        bestNewEquipmentsCategory.products = equipments
        
        equipments.append(equipment2)
        
        bestNewEquipmentsCategory.products = equipments
        
        equipments.append(equipment2)
        
        bestNewEquipmentsCategory.products = equipments
        
        
        let bestNewSellerCategory = ProductCategory()
        bestNewSellerCategory.name = "Best New Seller"
        
        var populars = [Product]()
        
        let popular1 = Product()
        popular1.name = "Biology book"
        popular1.category = "Populars"
        popular1.imageName = "book5"
        popular1.price = NSNumber(value: 2000 as Float)
        
        populars.append(popular1)
        
        bestNewSellerCategory.products = populars
    
        
      
        
        bestNewSellerCategory.products = populars
        
        let popular2 = Product()
        popular2.name = "BPmeasurement"
        popular2.category = "Populars"
        popular2.imageName = "bpmeasurement"
        popular2.price = NSNumber(value: 2000 as Float)
        
        
        populars.append(popular2)
        
        bestNewSellerCategory.products = populars
        
        
        populars.append(popular2)
        
        bestNewSellerCategory.products = populars
        
        
        populars.append(popular2)
        
        bestNewSellerCategory.products = populars
        
        
        populars.append(popular2)
        
        bestNewSellerCategory.products = populars
      
        return [bestNewBooksCategory, bestNewEquipmentsCategory,bestNewSellerCategory]


    }
}

class Product: NSObject{
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}
