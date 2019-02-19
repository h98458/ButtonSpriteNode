//
//  ButtonSpriteNode.h
//  LittleGreenMen
//  自定义按钮
//  Created by huangrg on 2019/2/18.
//  Copyright © 2019 HuangRonggui. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^TouchBlock)(void);

@interface ButtonSpriteNode : SKSpriteNode

-(id) initWithImageName:(NSString *)normal
               selected:(NSString *)selected
                disable:(NSString *)disable;

@property(nonatomic,assign)BOOL selected;

@property(nonatomic,assign)BOOL disable;

-(void) setMethod:(TouchBlock) touchMethod;

-(void) runMethod;

@end

NS_ASSUME_NONNULL_END
