//
//  SceneKitScene.m
//  SKiOS8NewFeatTutorial
//
//  Created by Orlando Pereira on 08/10/14.
//  Copyright (c) 2014 Orlando Pereira. All rights reserved.
//

#import "SceneKitScene.h"
#import <SceneKit/SceneKit.h>

@implementation SceneKitScene

-(void)didMoveToView:(SKView *)view {
    SCNScene *shipScene = [SCNScene sceneNamed:@"ship.dae"];

    
    SK3DNode *sk3DNodeFist = [[SK3DNode alloc]initWithViewportSize:CGSizeMake(300, 300)];
    [sk3DNodeFist setPosition:CGPointMake(200, 200)];
    [sk3DNodeFist setScnScene:shipScene];
    
    [self addChild:sk3DNodeFist];
    [self setBackgroundColor:[SKColor greenColor]];
}

@end
