//
//  UserInfoView.m
//  PhotoView
//
//  Created by iMac-iOS on 4/15/16.
//  Copyright © 2016 zhz. All rights reserved.
//

#import "UserInfoView.h"
#import <Masonry.h>

@interface UserInfoView ()

/** 背景视图 */
@property(nonatomic, strong) UIView *bgView;


/** 举报 */
@property(nonatomic, strong) UIButton *reportBtn;
/** 关注 */
@property(nonatomic, strong) UIButton *focusBtn;
/** 性别 */
@property(nonatomic, strong) UIImageView *genderImageView;
/** 头像 */
@property(nonatomic, strong) UIImageView *avatarImageView;
/** 等级 */
@property(nonatomic, strong) UILabel *levelLabel;
/** 昵称 */
@property(nonatomic, strong) UILabel *nickLabel;
/** 签名 */
@property(nonatomic, strong) UILabel *signatureLabel;


/** 类型 */
@property(nonatomic, assign) WantToShowRole style;


@end

@implementation UserInfoView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

+ (void)showUserInfoViewFromVCStyle:(WantToShowRole)style {
    UserInfoView *userView = [[UserInfoView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    userView.style = style;
    userView.backgroundColor = [UIColor lightGrayColor];
    [[UIApplication sharedApplication].keyWindow addSubview:userView];
    
    [userView addSubview:userView.bgView];
    [userView setupSubviews];
    
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.6 options:UIViewAnimationOptionLayoutSubviews animations:^{
        userView.frame = [UIScreen mainScreen].bounds;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.frame = frame;
    
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - private
- (void)setupSubviews {
    [self.bgView addSubview:self.reportBtn];
    [self.bgView addSubview:self.focusBtn];
    [self.bgView addSubview:self.genderImageView];
    [self.bgView addSubview:self.avatarImageView];
    [self.bgView addSubview:self.levelLabel];
    [self.bgView addSubview:self.nickLabel];
    [self.bgView addSubview:self.signatureLabel];
    
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(150, 50, 200, 50));
    }];
    [self.reportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.bgView).offset(10);
    }];
    [self.focusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView).offset(10);
        make.right.equalTo(self.bgView).offset(-10);
    }];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.reportBtn.mas_bottom);
        make.centerX.equalTo(self.bgView);
        make.width.height.mas_equalTo(80);
    }];
    [self.genderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.avatarImageView);
        make.right.equalTo(self.avatarImageView.mas_left).offset(-10);
        make.width.height.mas_equalTo(20);
    }];
    [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.avatarImageView);
        make.left.equalTo(self.avatarImageView.mas_right).offset(10);
    }];
    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.avatarImageView);
        make.top.equalTo(self.avatarImageView.mas_bottom).offset(10);
    }];
    [self.signatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.avatarImageView);
        make.left.equalTo(self.genderImageView);
        make.right.equalTo(self.levelLabel);
        make.top.equalTo(self.nickLabel.mas_bottom).offset(10);
    }];
    
}


#pragma mark - setter && getter
- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectZero];
        [_bgView setBackgroundColor:[UIColor whiteColor]];
    }
    return _bgView;
}

- (UIButton *)reportBtn {
    if (_reportBtn == nil) {
        _reportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reportBtn setTitle:@"举报" forState:UIControlStateNormal];
        [_reportBtn setTitleColor:[UIColor colorWithRed:0.2842 green:0.521 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    }
    return _reportBtn;
}

- (UIButton *)focusBtn {
    if (_focusBtn == nil) {
        _focusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_focusBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_focusBtn setTitleColor:[UIColor colorWithRed:0.2842 green:0.521 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    }
    return _focusBtn;
}

- (UIImageView *)genderImageView {
    if (_genderImageView == nil) {
        _genderImageView = [[UIImageView alloc] init];
        _genderImageView.backgroundColor = [UIColor redColor];
    }
    return _genderImageView;
}


- (UIImageView *)avatarImageView {
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.backgroundColor = [UIColor redColor];
    }
    return _avatarImageView;
}


- (UILabel *)levelLabel {
    if (_levelLabel == nil) {
        _levelLabel = [[UILabel alloc] init];
        _levelLabel.font = [UIFont systemFontOfSize:13];
        _levelLabel.text = @"等级";
    }
    return _levelLabel;
}

- (UILabel *)nickLabel {
    if (_nickLabel == nil) {
        _nickLabel = [[UILabel alloc] init];
        _nickLabel.font = [UIFont systemFontOfSize:13];
        _nickLabel.textAlignment = NSTextAlignmentCenter;
        _nickLabel.text = @"鱼泡泡";
    }
    return _nickLabel;
}

- (UILabel *)signatureLabel {
    if (_signatureLabel == nil) {
        _signatureLabel = [[UILabel alloc] init];
        _signatureLabel.font = [UIFont systemFontOfSize:13];
        _signatureLabel.numberOfLines = 0;
        _signatureLabel.text = @"个性签名个性签名个性签名个性签名个性签名个性签名个性签名个性签名";
    }
    return _signatureLabel;
}

@end
