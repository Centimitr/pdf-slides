//
//  Doc.swift
//  PDF Slides
//
//  Created by Xiao Shi on 9/7/18.
//  Copyright © 2018 devbycm. All rights reserved.
//

import Foundation
import PDFKit

class Doc: PDFDocument {
    override var pageClass: AnyClass {
        get {
            return Page.self
        }
    }
}
