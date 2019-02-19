//
//  ButtonSpriteNode.m
//  LittleGreenMen
//  自定义按钮
//  Created by huangrg on 2019/2/18.
//  Copyright © 2019 HuangRonggui. All rights reserved.
//

#import "ButtonSpriteNode.h"

@interface ButtonSpriteNode ()
{
    //normalButto
    SKSpriteNode *_normalButton;
    
    //selectedButton
    SKSpriteNode *_selectedButton;
    
    //disableButton
    SKSpriteNode *_disableButton;
    
    //
    TouchBlock _touchMethod;
}
@end

@implementation ButtonSpriteNode

-(id) initWithImageName:(NSString *)normal
               selected:(NSString *)selected
                disable:(NSString *)disable {
    self = [super init];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        //normalButton
        _normalButton = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:normal]];
        _normalButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        _normalButton.hidden = NO;
        [self addChild: _normalButton];
        
        //selectedButton
        _selectedButton = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:selected]];
        _selectedButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        _selectedButton.hidden = YES;
        [self addChild: _selectedButton];
        
        //disableButton
        _disableButton = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:disable]];
        _disableButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        _disableButton.hidden = YES;
        [self addChild: _disableButton];
        
    }
    return self;
}

-(void)setSelected:(BOOL)selected{
    _selected = selected;
    _disable = NO;
    if (selected) {
        _normalButton.hidden = YES;
        _selectedButton.hidden = NO;
        _disableButton.hidden = YES;
    }else{
        _normalButton.hidden = NO;
        _selectedButton.hidden = YES;
        _disableButton.hidden = YES;
    }
}

-(void)setdisable:(BOOL)disable{
    _disable = disable;
    _selected = NO;
    if (disable) {
        _normalButton.hidden = YES;
        _selectedButton.hidden = YES;
        _disableButton.hidden = NO;
    }else{
        _normalButton.hidden = NO;
        _selectedButton.hidden = YES;
        _disableButton.hidden = YES;
    }
}

-(void) setMethod:(TouchBlock) touchMethod {
    _touchMethod = touchMethod;
}

-(void) runMethod {
    if (_touchMethod) {
        _touchMethod();
    }
    
}

#pragma mark -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_selected || _disable) {
        return;
    }
    _normalButton.hidden = YES;
    _selectedButton.hidden = NO;
    _disableButton.hidden = YES;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_selected || _disable) {
        return;
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_selected || _disable) {
        return;
    }
    _normalButton.hidden = NO;
    _selectedButton.hidden = YES;
    _disableButton.hidden = YES;
    [self runMethod];
}

@end
