//
//  LightingScene.m
//  SKiOS8NewFeatTutorial
//
//  Created by Orlando Pereira on 08/10/14.
//  Copyright (c) 2014 Orlando Pereira. All rights reserved.
//

#import "LightingScene.h"

@implementation LightingScene

-(void)didMoveToView:(SKView *)view {
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Wicked-Cat"];
    [sprite setPosition:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
    [sprite setScale:0.6];
    [sprite setZPosition:1];
    [sprite setShadowedBitMask:1];
    [sprite setLightingBitMask:1];
    [self addChild:sprite];
}

@end
