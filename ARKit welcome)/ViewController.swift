//
//  ViewController.swift
//  ARKit welcome)
//
//  Created by Alisher Batyrkanov on 7/8/19.
//  Copyright © 2019 Alisher Batyrkanov. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // MARK: Load Happy Model
        let scene = SCNScene()
        let happy = loadModel(named: "art.scnassets/Dragon 2.5_dae.dae")!
        happy.position = SCNVector3(-0.5, 0, -1)
        happy.scale = SCNVector3(0.02, 0.02, 0.02)
        scene.rootNode.addChildNode(happy)
        
        let ship = loadModel(named: "art.scnassets/ship.scn")!
        ship.position = SCNVector3(0.5, 0, -1)
        scene.rootNode.addChildNode(ship)
        
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func loadModel(named modelName: String) -> SCNNode? {
       guard let scene = SCNScene(named: modelName) else { return nil }
        let node = scene.rootNode.clone()
        
        return node
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
