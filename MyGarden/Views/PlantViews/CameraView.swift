//
//  CameraView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 13/11/24.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var capturedImage: UIImage?
    @Binding var captureDate: Date?
    
    var body: some View {
        ZStack {
            CameraPreview(capturedImage: $capturedImage,
                         captureDate: $captureDate,
                         dismiss: dismiss)
                .ignoresSafeArea()
        }
    }
}

#Preview("Empty State") {
    CameraView(
        capturedImage: .constant(nil),
        captureDate: .constant(nil)
    )
}
