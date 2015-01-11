//
//  HomeTableViewController.m
//  myWeibo
//
//  Created by HeZitong on 14/11/6.
//  Copyright (c) 2014年 HeZitong. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HomeTableViewCell.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    weiboMutableArray = [[NSMutableArray alloc] init];
    NSMutableString *mutableStr = [NSMutableString stringWithString:@"把毫无音乐素养的庞麦郎和刚出道时的才华横溢、一步两步一步两步，一步一步似爪牙，似魔鬼的步伐，"];
    for (NSInteger index = 0; index < 10; index++) {
        HomeModel *homeModel = [[HomeModel alloc] init];
        homeModel.weiboImage = [NSString stringWithFormat:@"1.jpg"];
        homeModel.weiboUsersName = @"约瑟翰·庞麦郎";
        homeModel.weiboSource = @"来自xiami.com";
        homeModel.weiboContent = mutableStr;
        [mutableStr appendString:mutableStr];
        homeModel.weiboForwardNum = 123 + index;
        homeModel.weiboReplyNum = 122 + index;
        homeModel.weiboZanNum = 12 + index;
        [weiboMutableArray addObject:homeModel];
    }
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor colorWithRed:253.0/255 green:109.0/255 blue:10.0/255 alpha:0.7];
    [self.refreshControl addTarget:self action:@selector(controlPullDown) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addFooterWithTarget:self action:@selector(refreshFooter)];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)controlPullDown{
    if (self.refreshControl.refreshing) {
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"加载中..."];
        [self performSelector:@selector(refreshHomeData) withObject:nil afterDelay:0.8];
    }
    
}
//下拉使用第三方库UIScrollView+DXRefresh
- (void)refreshFooter
{
    [self updateSomeThing];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
    });
}

- (void)handUpdateF
{
    [self.tableView footerBeginRefreshing];
    [self refreshFooter];
}

- (void)updateSomeThing
{
    HomeModel *homeModel = [[HomeModel alloc] init];
    homeModel.weiboImage = [NSString stringWithFormat:@"Ma.png"];
    homeModel.weiboUsersName = @"马云";
    homeModel.weiboSource = @"来自阿里巴巴";
    homeModel.weiboContent = @"大家好！我叫马云！";
    homeModel.weiboForwardNum = 222;
    homeModel.weiboReplyNum = 223;
    homeModel.weiboZanNum = 233;
    [weiboMutableArray addObject:homeModel];
    
}

- (void)refreshHomeData{
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];//有问题，第一次开始下拉，只有小菊花，第一次开始刷新显示加载中，第二次刷新开始下拉显示下拉刷新，然后变成加载中。与第一次刷新下拉过程不一样。。
    HomeModel *homeModel = [[HomeModel alloc] init];
    homeModel.weiboImage = [NSString stringWithFormat:@"Ma.png"];
    homeModel.weiboUsersName = @"马云";
    homeModel.weiboSource = @"来自阿里巴巴";
    homeModel.weiboContent = @"大家好！我叫马云！";
    homeModel.weiboForwardNum = 222;
    homeModel.weiboReplyNum = 223;
    homeModel.weiboZanNum = 233;
    [weiboMutableArray insertObject:homeModel atIndex:0];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [weiboMutableArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"weiboModel";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    HomeModel *model = [weiboMutableArray objectAtIndex:indexPath.row];
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc] initWithReusedIdentifier:CellIdentifier];
    }
    [cell.usersImageView setImage:[UIImage imageNamed:model.weiboImage]];
    cell.usersNameLabel.text = model.weiboUsersName;
    cell.sourceLabel.text = model.weiboSource;
    [cell setContentText:model.weiboContent];
    cell.forwardNumLabel.text = [NSString stringWithFormat:@"%d",model.weiboForwardNum];
    cell.replyNumLabel.text = [NSString stringWithFormat:@"%d",model.weiboReplyNum];
    cell.zanNumLabel.text = [NSString stringWithFormat:@"%d",model.weiboZanNum];

//    NSString *contentStr = model.weiboContent;
//    NSInteger contentLength = [model.weiboContent length];
//    if(contentLength >= 80){
//        contentLabel.text = [[contentStr substringToIndex:79] stringByAppendingString:@"..."];
//    }
//    else{
//        cell.contentLabel.text = contentStr;//
//    }
//    [cell.contentLabel setNumberOfLines:0];//
//    [contentLabel sizeToFit];
    //size to fit 这个方法还是要慎用啊。。。字数多了也一定会显示出来
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
