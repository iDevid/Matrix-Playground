import SpriteKit

//MatrixLabel SKLabelNode Class
public class MatrixLabel: SKLabelNode {
    
    let values = ["","","","","","","","","",
                  "","","","","","","","","",
                  "","","","","",""]
    
    public init (size: Int, position: CGPoint) {
        super.init()
        self.fontName = "mCode15"
        self.text = values.random
        self.fontColor = NSColor.green
        self.position = position
        self.fontSize = CGFloat(size)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
