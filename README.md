# ButtonSpriteNode

Simple SpriteKit Button Class

Example

ButtonSpriteNode *_fight = [[ButtonSpriteNode alloc] initWithImageName:@"fire_btn1.png" selected:@"fire_btn2.png" disable:@"fire_btn3.png"];
    _fight.position = CGPointMake(_fightBg.frame.size.width/2, _fightBg.frame.size.height/2);
    [_fight setMethod: ^ (void) {
        NSLog(@"fighting!");
    } ];
    [_fightBg addChild:_fight];
    

