//
//  Bullet.swift
//  Infection Tag
//
//  Created by 64000774 on 12/17/20.
//

//
//  Gun.swift
//  Infection Tag
//
//  Created by 64000774 on 12/15/20.
//

import SpriteKit

class Bullet: SKSpriteNode {
    
    var shot: Bool = false
    var pickedUp: Bool = false
    var time: Int?
    var ang: CGFloat?
    var dbullet: DBullet?
    
    init(pos: CGPoint,scale: CGFloat ) {
//        self.id = ID
        // Make a texture from an image, a color, and size
        let texture = SKTexture(imageNamed: "bullet")

        let color = UIColor.clear
        let size = CGSize(width: 50*scale, height: 50*scale)
            // Call the designated initializer
        super.init(texture: texture, color: color, size: size)
        self.position = pos
        
    }
    
    func setPosition() {
        if (self.shot) {
            let x = self.position.x + 10*cos(self.ang! + CGFloat(Float.pi))
            let y = self.position.y + 10*sin(self.ang! + CGFloat(Float.pi))
            self.time!+=1
            self.position = CGPoint(x: x, y: y)
            self.dbullet!.xPos = Float(self.position.x)
            self.dbullet!.yPos = Float(self.position.y)
        }
    }
    
    func shoot(char: Gun, angle: CGFloat) {
        self.zRotation = angle+CGFloat(Float.pi/2)
        self.shot = true
        self.ang = angle
        let x = char.position.x + 10*cos(angle + CGFloat(Float.pi))
        let y = char.position.y + 10*sin(angle + CGFloat(Float.pi))
        self.position = CGPoint(x: x, y: y)
        self.time = 0
        self.dbullet = DBullet(xPos: Float(self.position.x), yPos: Float(self.position.y), zRot: Float(self.zRotation))
        
    }
    func pickUp() {
        pickedUp = true
        
        self.removeFromParent()
    }
    
    func doneShooting() -> Bool {
        if self.time! > 200 {
            self.removeFromParent()
            return true
        }
        return false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
