//
//  ViewController.swift
//  World Tracking
//
//  Created by Vinicius Brito on 06/12/17.
//  Copyright © 2017 Vinicius Brito. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController
{
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actionAdd(_ sender: Any)
    {
//        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
//        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        pyramid.position = SCNVector3(0,0,-0.3)
//        pyramid.eulerAngles = SCNVector3(Float(180.degreesToRadians),0,0)
//        self.sceneView.scene.rootNode.addChildNode(pyramid)
        
        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown

        let windowNode = SCNNode(geometry: SCNPlane(width: 0.025, height: 0.025))
        windowNode.geometry?.firstMaterial?.diffuse.contents = UIColor.purple

        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
//        node.geometry = SCNCapsule(capRadius:0.1, height:0.3)
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)

//        let x = randomNumbers(firstNum:  -0.3, secondNum: 0.3)
//        let y = randomNumbers(firstNum:  -0.3, secondNum: 0.3)
//        let z = randomNumbers(firstNum:  -0.3, secondNum: 0.3)
        
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x:0, y:0))
//        path.addLine(to: CGPoint(x: 0,   y: 0.2))
//        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
//        path.addLine(to: CGPoint(x: 0.4, y: 0.2))
//        path.addLine(to: CGPoint(x: 0.4, y: 0  ))
//        let shape = SCNShape(path: path, extrusionDepth:0.2)
//        node.geometry = shape
        
        
        let node = SCNNode()
        node.geometry = SCNPyramid(width:0.1, height:0.1, length: 0.1)
        node.geometry?.firstMaterial?.specular.contents = UIColor.orange
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.red

        node.position = SCNVector3(0.2,0.3,-0.2)
        self.sceneView.scene.rootNode.addChildNode(node)

        boxNode.position = SCNVector3(0,-0.05,0)
        node.addChildNode(boxNode)

        doorNode.position = SCNVector3(-0.015, -0.02,0.0501)
        boxNode.addChildNode(doorNode)

        windowNode.position = SCNVector3(0.025, -0.01, 0.0501)
        boxNode.addChildNode(windowNode)
    }
    
    @IBAction func actionReset(_ sender: Any)
    {
        self.restartSession()
    }
    
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

extension Int
{
    var degreesToRadians: Double { return Double(self) * .pi/180}
}

