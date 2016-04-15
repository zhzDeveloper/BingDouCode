//
//  UserInfoView.h
//  PhotoView
//
//  Created by iMac-iOS on 4/15/16.
//  Copyright © 2016 zhz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WantToShowRole) {
    WantToShowRoleNone,         //游客
    WantToShowRoleNormalUser,   //普通用户
    WantToShowRoleAnchor,       //主播
};

@interface UserInfoView : UIView

/** 用户Id */
@property(nonatomic, copy) NSString *userInfoId;


+ (void)showUserInfoViewFromVCStyle:(WantToShowRole)style;

@end
