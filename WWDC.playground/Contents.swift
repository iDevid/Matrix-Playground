

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

//Some Settings
let elementSize = 10
let horizontalElements = sceneWidth/elementSize


//This function start the spawning of the letters over the x axys
func startSpawning() {
    let randomXPos = Int(arc4random_uniform(UInt32(horizontalElements))) * 10 + (elementSize / 2)
    let letter = MatrixLabel(size: elementSize, position: CGPoint(x: randomXPos, y: sceneHeight - 11))
    scene.addChild(letter)
    asyncDelay(seconds: 0.2, completion: {
        spawnBehind(xPosition: randomXPos, yPosition: Int(letter.position.y) - 11)
    })
    
}


func spawnBehind(xPosition: Int, yPosition: Int) {
    let letter = MatrixLabel(size: elementSize, position: CGPoint(x: xPosition, y: yPosition))
    scene.addChild(letter)
    // If the letter is behind the scene don't spawn anymore
    if Int(letter.position.y) - 11 > 0 {
        asyncDelay(seconds: 0.2, completion: {
            spawnBehind(xPosition: xPosition, yPosition: Int(letter.position.y) - 11)
        })
    }
}


scene.run(
    SKAction.repeat(
        SKAction.sequence([
            SKAction.run(startSpawning),
            SKAction.wait(forDuration: 0.2)
            ]),
        count: 1000)
)

print("ciao")
