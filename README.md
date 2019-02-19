# ButtonSpriteNode

Simple SpriteKit Button Class

Example
    
    ButtonSpriteNode *_fight = [[ButtonSpriteNode alloc] initWithImageName:@"fire_btn1.png" selected:@"fire_btn2.png" disable:@"fire_btn3.png"];
    
    _fight.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    [_fight setMethod: ^ (void) {
        NSLog(@"fighting");
    } ];
    
    [self addChild:_fight];
    
Button selected

_fight.selected = Yes;


Button disable

_fight.disable = Yes;
