//
//  PanoTableViewCell.m
//  全景_图片
//
//  Created by 张星宇 on 11/14/17.
//  Copyright © 2017 H. All rights reserved.
//

#import "PanoTableViewCell.h"
#import "BSPanoramaView.h"

#define kPanoViewInterval 4

@interface PanoTableViewCell()

@property (nonatomic, strong) BSPanoramaView *panoView;

@end

@implementation PanoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 300);
        self.panoView = [[BSPanoramaView alloc] initWithFrame:rect];
        [self.contentView addSubview:self.panoView];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)willBeDisplayed:(NSUInteger)index {
    
    //请大神帮忙
    //问题一  DEMO  会有黑屏的出现概率比较高
    [self.panoView setImageWithName:self.imgName.length?self.imgName:@"test"];
    //问题二 请大神帮忙看看这里我使用sdwebimage 去加载url 下载成功且能获取uiimage但是不显示,报错误异常：UserInfo={GLKTextureLoaderErrorKey=Image decoding failed}
//    [self.panoView setImageWithUrl:@"https://shcm09.baidupcs.com/file/79209408efdc74c587fa8a6bc55e0f97?bkt=p3-140079209408efdc74c587fa8a6bc55e0f97056eabb000000004761f&fid=2248673453-250528-376688391583625&time=1511792966&sign=FDTAXGERLQBHSK-DCb740ccc5511e5e8fedcff06b081203-7izbI%2BQqpop3KCwqWs%2FtT0DyNF0%3D&to=71&size=292383&sta_dx=292383&sta_cs=0&sta_ft=jpg&sta_ct=0&sta_mt=0&fm2=MH,Yangquan,Anywhere,,beijing,cmnet&vuk=2248673453&iv=0&newver=1&newfm=1&secfm=1&flow_ver=3&pkey=140079209408efdc74c587fa8a6bc55e0f97056eabb000000004761f&sl=79364174&expires=8h&rt=sh&r=705401448&mlogid=7675365852238913753&vbdid=4005626873&fin=151177440803866507_2000x1000.crop.jpg&fn=151177440803866507_2000x1000.crop.jpg&rtype=1&dp-logid=7675365852238913753&dp-callid=0.1.1&hps=1&tsl=100&csl=100&csign=q%2Bpj%2FZnhi2DPMzx8u7oroxFmw1E%3D&so=0&ut=6&uter=4&serv=0&uc=2439629090&ic=2487890465&ti=5e666840c78f1973922acdab677983dfeb0ca803bb93a2b6305a5e1275657320&by=themis"];
}

- (void)didStopDisplayed:(NSUInteger)index {
    [self.panoView unloadImage];
}

@end
