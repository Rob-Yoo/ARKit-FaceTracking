//
//  ViewController.swift
//  ARFaceTracking1
//
//  Created by Jinyoung Yoo on 4/2/24.
//

import UIKit
import ARKit

class HomeViewController: UIViewController {
    let sceneView = ARSceneView(frame: .infinite)

    override func loadView() {
        super.loadView()
        self.view = sceneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.autoenablesDefaultLighting = true
        self.sceneView.beginARSession()
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.viewWillDisappear(animated)
        self.sceneView.session.pause()
    }

}

class ARSceneView: ARSCNView {
    override init(frame: CGRect, options: [String : Any]? = nil) {
        super.init(frame: frame, options: options)
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func beginARSession() {
        let configuration = ARFaceTrackingConfiguration()
        self.session.run(configuration)
    }
}

extension ARSceneView: ARSCNViewDelegate {
    func renderer(_ renderer: any SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let faceAnchor = anchor as? ARFaceAnchor else { return nil }
        
        let device = MTLCreateSystemDefaultDevice()!
        let faceGeometry = ARSCNFaceGeometry(device: device)
        let node = SCNNode(geometry: faceGeometry)
        
        node.geometry?.firstMaterial?.fillMode = .lines
        return node
    }
}

