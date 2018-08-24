//
//  DocumentViewController.swift
//  PDF Slides
//
//  Created by Xiao Shi on 12/4/18.
//  Copyright © 2018 devbycm. All rights reserved.
//

import UIKit
import PDFKit

class DocumentViewController: UIViewController {
    
    @IBOutlet weak var documentNameLabel: UILabel!
    
    var document: UIDocument?
    var pdfView: CMPDFView?
//    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let v = CMPDFView(view: self.view)
        pdfView = v
        self.view.addSubview(v)
        self.view.sendSubviewToBack(v)

        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
//                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
                if let pdf = Doc(url: (self.document?.fileURL)!) {
                    if let v = self.pdfView {
                        v.document = pdf
                        let v2 = CMPDFView(view: self.view)
                        v2.document = pdf
                        self.view.addSubview(v2)
                        self.view.sendSubviewToBack(v2)
                        
                    }

//                    self.pdfView?.document = pdf
//                    self.pdfView?.displayMode = .singlePage
//                    self.pdfView?.scaleFactor = (self.pdfView?.scaleFactorForSizeToFit)!;
//                    self.pdfView?.maxScaleFactor = (self.pdfView?.scaleFactorForSizeToFit)!;
//                    self.pdfView?.minScaleFactor = (self.pdfView?.scaleFactorForSizeToFit)!;
                }
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
        view.isUserInteractionEnabled = true
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { _ in
            UIView.animate(withDuration: 0) {
//                self.pdfView?.scaleFactor = (self.pdfView?.scaleFactorForSizeToFit)!
            }
        }, completion: nil)
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        guard sender.view != nil else { return }
        
        if sender.state == .ended {
            let location = sender.location(in: view)
            let viewSize = view.bounds.size
            let pos = location.x / viewSize.width
            if pos <= 0.4 {
                pdfView?.goToPreviousPage(sender)
            }else if pos >= 0.6 {
                pdfView?.goToNextPage(sender)
            }
        }
    }
}
