

//: # Matrix Intro
//: ### This Playground reproduce the Matrix Intro with SpriteKit.
//: ## ©Davide Sibilio 2017
import Cocoa
import Foundation
import SpriteKit
import PlaygroundSupport

//Set Up Scene

///You can modify this values at your pleasure (step by 10 the width)
let sceneWidth = 450
let sceneHeight = 600

let view = SKView(frame: CGRect(x: 0, y: 0, width: sceneWidth, height: sceneHeight))
view.showsFPS = true
view.showsPhysics = true
view.showsNodeCount = true

let scene = SKScene(size: CGSize(width: sceneWidth, height: sceneHeight))
scene.scaleMode = SKSceneScaleMode.aspectFill
view.presentScene(scene)

//Setup Playground Live View

PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true

//Loading Matrix Font Resource
let matrixFontUrl = Bundle.main.url(forResource: "matrixFont", withExtension: "ttf") as! CFURL
CTFontManagerRegisterFontsForURL(matrixFontUrl, CTFontManagerScope.process, nil)

let elementSize = 10
let horizontalElements = sceneWidth/elementSize

func spawnLetter() {
    let randomXPos = Int(arc4random_uniform(UInt32(horizontalElements))) * 10 + (elementSize / 2)
    let letter = MatrixLabel(size: elementSize, position: CGPoint(x: randomXPos, y: sceneHeight - 11))
    scene.addChild(letter)
}


scene.run(
    SKAction.repeat(
        SKAction.sequence([
            SKAction.run(spawnLetter),
            SKAction.wait(forDuration: 0.02)
            ]),
        count: 1000)
)
