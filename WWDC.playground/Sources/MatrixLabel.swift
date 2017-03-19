import SpriteKit

//MatrixLabel SKLabelNode Class
public class MatrixLabel: SKLabelNode {
    
    let values = ["","","","","","","","","",
                  "","","","","","","","","",
                  "","","","","",""]
    let colorValues = [NSColor(red: 0, green: 255, blue: 0, alpha: 0.9),
                       NSColor(red: 0, green: 255, blue: 0, alpha: 0.8),
                       NSColor(red: 0, green: 255, blue: 0, alpha: 0.6),
                       NSColor(red: 100, green: 250, blue: 100, alpha: 0.9),
                       NSColor(red: 150, green: 250, blue: 150, alpha: 0.7),
                       NSColor(red: 255, green: 255, blue: 255, alpha: 0.9)]
    
    public init (size: Int, position: CGPoint) {
        super.init()
        self.fontName = "mCode15"
        self.text = values.random
        self.fontColor = colorValues.random
        self.color = self.fontColor
        self.position = position
        self.fontSize = CGFloat(size)
    }
    
    public func startToFade() {
        self.run(SKAction.fadeAlpha(to: 0, duration: 1), completion: {
            self.removeFromParent()
        })
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
