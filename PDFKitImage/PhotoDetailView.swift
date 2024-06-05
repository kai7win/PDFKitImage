//
//  PhotoDetailView.swift
//  PDFKitImage
//
//  Created by Thomas on 2024/5/31.
//

import SwiftUI
import PDFKit

struct PhotoDetailView: UIViewRepresentable {
    let image: UIImage

    func makeUIView(context: Context) -> PDFView {
        let view = PDFView()
        view.autoScales = true
        return view
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            let document = PDFDocument()
            if let page = PDFPage(image: self.image) {
                document.insert(page, at: 0)
            }
            DispatchQueue.main.async {
                uiView.document = document
            }
        }
    }
}
