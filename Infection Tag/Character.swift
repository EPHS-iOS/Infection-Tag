//
//  Character.swift
//  Infection Tag
//
//  Created by 64000774 on 10/21/20.
//

import SpriteKit

var walkSprites :[SKTexture] = [SKTexture]()
var ZwalkSprites :[SKTexture] = [SKTexture]()


class Character: SKSpriteNode {
    
    var id: String
    var isInfected: Bool
    init(isInfected: Bool, ID: String) {
        self.id = ID
        // Make a texture from an image, a color, and size
        let texture = walkSprites[2]

        let color = UIColor.clear
        let size = texture.size()
        self.isInfected=isInfected
        // Call the designated initializer
        super.init(texture: texture, color: color, size: size)

        // Set physics properties
//        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
//        physicsBody?.categoryBitMask = 1
//        physicsBody?.friction = 0.6
//        physicsBody?.mass = 0.5
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
