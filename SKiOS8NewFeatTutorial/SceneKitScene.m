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


    //Step 2...Importing an External Model
-(void)didMoveToView:(SKView *)view {
    SCNScene *shipScene = [SCNScene sceneNamed:@"ship.dae"];
    
    SK3DNode *sk3DNodeFist = [[SK3DNode alloc]initWithViewportSize:CGSizeMake(300, 300)];
    [sk3DNodeFist setPosition:CGPointMake(200, 200)];
    [sk3DNodeFist setScnScene:shipScene];
    
    [self addChild:sk3DNodeFist];
    
    [self setBackgroundColor:[SKColor greenColor]];
    
    
        //Step 3...Creating a Custom Scene
    SK3DNode *sk3DNode = [[SK3DNode alloc] initWithViewportSize:CGSizeMake(400, 400)];
    [sk3DNode setPosition:CGPointMake(150, 200)];
    
    SCNScene *sceneObject = [SCNScene scene];
        //Needs 3 nodes: Lights, Camera, and 3D action (er, object).
//    a. Create the object needed.
//    b. Create a node to liason with the object.
//    c. Add the node to the parent node -- the Scene object.
    
        //LIGHTS!
    SCNLight *spotLight = [SCNLight light];
    [spotLight setType:SCNLightTypeDirectional];
    [spotLight setColor:[SKColor redColor]];
    
    SCNNode *spotLightNode = [SCNNode node];
    [spotLightNode setLight:spotLight];
    [spotLightNode setPosition:SCNVector3Make(0, 0, 5)];
    
        //CAMERA!!
    SCNCamera *camera = [SCNCamera camera];
    SCNNode *cameraNode = [SCNNode node];
    [cameraNode setCamera:camera];
    [cameraNode setPosition:SCNVector3Make(0, 0, 40)];
    [sceneObject.rootNode addChildNode:cameraNode];
    [cameraNode addChildNode:spotLightNode];
    [sceneObject.rootNode addChildNode:spotLightNode];
    
    SCNTorus *torus = [SCNTorus torusWithRingRadius:13 pipeRadius:1.5];
    SCNNode *torusNode = [SCNNode nodeWithGeometry:torus];
    [torusNode setTransform:SCNMatrix4MakeRotation(M_PI / 3, 0, 1, 0)];
    [sceneObject.rootNode addChildNode:torusNode];
    
    
        //SCENE (action) OBJECT!!!
    [sk3DNode setScnScene:sceneObject];
    [self addChild:sk3DNode];
    
    
    
}

@end
