//
//  ViewController.swift
//  ARApp
//
//  Created by Gökhan Tuncay on 6.11.2025.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        for node in sceneView.scene.rootNode.childNodes {
            let moveShip = SCNAction.moveBy(x: 0, y: 0.1, z: 0.5, duration: 1)
            let repeatForever = SCNAction.repeatForever(moveShip)
            node.runAction(repeatForever)
        }
        
        func createSphere(radius: CGFloat, texture: String, vector: SCNVector3) -> SCNNode{
            let mySphere = SCNSphere(radius: radius)
            let sphereMaterial = SCNMaterial()
            sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(texture)")
            mySphere.materials = [sphereMaterial]
            let sphereNode = SCNNode()
            sphereNode.position = vector
            sphereNode.geometry = mySphere
            return sphereNode
        }
        
        func rotateSphere(angle: SCNVector3, speed: CGFloat) -> SCNAction{
            let rotateAngle = angle
            let rotateNode = SCNAction.rotate(by: speed, around: rotateAngle, duration: 1)
            let rotateForever = SCNAction.repeatForever(rotateNode)
            return rotateForever
        }
        
        let gezegenBir = createSphere(radius: 0.1, texture: "arid.png", vector:  SCNVector3(0.1, 0.1, -0.5))
        let gezegenIki = createSphere(radius: 0.4, texture: "gas.png", vector: SCNVector3(-0.4, -0.4, -0.5))
        let gezegenUc = createSphere(radius: 0.05, texture: "marsh.png", vector: SCNVector3(0.2, 0.4, -1))
        gezegenBir.runAction(rotateSphere(angle: SCNVector3( 0, -0.1, 0), speed: 1))
        gezegenIki.runAction(rotateSphere(angle: SCNVector3(0, 0.01, 0), speed: 0.02))
        gezegenUc.runAction(rotateSphere(angle: SCNVector3(0, 1, 0), speed: 20))
        
        sceneView.scene.rootNode.addChildNode(gezegenBir)
        sceneView.scene.rootNode.addChildNode(gezegenIki)
        sceneView.scene.rootNode.addChildNode(gezegenUc)
        
        
        
        
        
        
        
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
