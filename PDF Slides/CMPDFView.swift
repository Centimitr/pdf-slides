//
//  CMPDFView.swift
//  PDF Slides
//
//  Created by Xiao Shi on 10/7/18.
//  Copyright © 2018 devbycm. All rights reserved.
//

import Foundation
import PDFKit

class CMPDFView: PDFView {
    
    init(view: UIView) {
        super.init(frame: view.bounds)
        backgroundColor = .lightGray
        displayMode = .singlePage
        autoScales = true
        //        self.pdfView?.backgroundColor = .lightGray
        //        self.pdfView?.displayMode = .singlePage
        //        self.pdfView?.autoScales = false
        //        self.pdfView?.displayBox = .mediaBox
        contentMode = .scaleAspectFit
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func visiblePages() -> [PDFPage] {
//        var pages = super.visiblePages()
//        if let doc = document {
//            let index = doc.index(for: pages.last!)
//            if let next = document?.page(at: index+1) {
//                pages.append(next)
//            }
//        }
//        print(pages.count)
//        return pages
//    }
}
