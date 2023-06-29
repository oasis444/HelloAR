//
//  ContentView.swift
//  HelloAR
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let anchor = AnchorEntity(plane: .horizontal)
        
        // 텍스트 생성
        let textMaterial = SimpleMaterial(
            color: .systemPink,
            isMetallic: true
        )
        
        let text = ModelEntity(mesh: MeshResource.generateText(
            "Hello AR",
            extrusionDepth: 0.03,
            font: .systemFont(ofSize: 0.2),
            containerFrame: .zero,
            alignment: .center,
            lineBreakMode: .byCharWrapping
        ), materials: [textMaterial])
       
        anchor.addChild(text)
        
        // 객체 생성
//        let boxMaterial = SimpleMaterial(color: .systemPink, isMetallic: true)
//        let box = ModelEntity(
//            mesh: MeshResource.generateBox(size: 0.3, cornerRadius: 0.05),
//            materials: [boxMaterial]
//        )
//
//        let sphereMaterial = SimpleMaterial(color: .systemYellow, isMetallic: true)
//        let sphere = ModelEntity(
//            mesh: MeshResource.generateSphere(radius: 0.2),
//            materials: [sphereMaterial]
//        )
//        sphere.position = simd_make_float3(0.2, 0.4, 0.3)
//
//        let planeMeterial = SimpleMaterial(color: .systemBlue, isMetallic: true)
//        let plane = ModelEntity(
//            mesh: MeshResource.generatePlane(
//                width: 0.5,
//                depth: 0.3
//            ),
//            materials: [planeMeterial]
//        )
//        plane.position = simd_make_float3(0, 0.7, 0)
//
//        [box, sphere, plane].forEach {
//            anchor.addChild($0)
//        }
        
        arView.scene.anchors.append(anchor)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
