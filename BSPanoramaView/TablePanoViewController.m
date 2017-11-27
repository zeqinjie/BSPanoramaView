//
//  TablePanoViewController.m
//  BSPanoramaView
//
//  Created by 张星宇 on 11/15/17.
//  Copyright © 2017 bestswifter. All rights reserved.
//

#import "TablePanoViewController.h"
#import "PanoTableViewCell.h"

@interface TablePanoViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *vrimgs;
@end

@implementation TablePanoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vrimgs = @[@"MyArroundVRImg",@"MyArroundVRImg2",@"MyArroundVRImg3"];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 414, 736)];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.estimatedRowHeight = 736;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 3 == 1) {
        PanoTableViewCell *cell = (PanoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PanoTableViewCell"];
        cell.imgName = self.vrimgs[indexPath.row%3];
        if (!cell) {
            cell = [[PanoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PanoTableViewCell"];
        }
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
            cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
            cell.contentView.backgroundColor = [UIColor grayColor];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 3 == 1) {
        return 300;
    }
    return 100;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[PanoTableViewCell class]]) {
        PanoTableViewCell *panoCell = (PanoTableViewCell *)cell;
        [panoCell willBeDisplayed:indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[PanoTableViewCell class]]) {
        PanoTableViewCell *panoCell = (PanoTableViewCell *)cell;
        [panoCell didStopDisplayed:indexPath.row];
    }
}

@end
