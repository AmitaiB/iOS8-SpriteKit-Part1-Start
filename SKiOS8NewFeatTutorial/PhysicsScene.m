//
//  PhysicsScene.m
//  SKiOS8NewFeatTutorial
//
//  Created by Orlando Pereira on 08/10/14.
//  Copyright (c) 2014 Orlando Pereira. All rights reserved.
//

#import "PhysicsScene.h"

@implementation PhysicsScene {
    SKFieldNode *magneticFieldNode;
}


-(void)didMoveToView:(SKView *)view {

    
        //Make the frame the world, and set that world to have gravity, in addition to the magnetic field.
    SKPhysicsBody *physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    [self.physicsWorld setGravity:CGVectorMake(9, -9)];
    [self setPhysicsBody:physicsBody];
    
        //Now set up and make a magnetic field.
    magneticFieldNode = [SKFieldNode magneticField];
    [magneticFieldNode setPhysicsBody:[SKPhysicsBody bodyWithCircleOfRadius:80]];
    [magneticFieldNode setPosition:CGPointMake(100, 100)];
    [magneticFieldNode setStrength:3];
    [self addChild:magneticFieldNode];
    
    for (NSInteger i = 0; i < 300; i++) {
        SKSpriteNode *node4 = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"wood"]
                                                             size:CGSizeMake(25, 25)];
        [node4 setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(25, 25)]];
        [node4 setPosition:CGPointMake(arc4random()%640, arc4random()%950)];
         node4.physicsBody.dynamic           = YES;
         node4.physicsBody.affectedByGravity = YES;
         node4.physicsBody.allowsRotation    = true;
         node4.physicsBody.mass              = 0.9;
        
        [self addChild:node4];
        
        
        
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        magneticFieldNode.position = [touch locationInNode:self];
    }
}

@end
