//
//  HomeMoreController.m
//  MyFlight2.0
//
//  Created by WangJian on 12-12-16.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import "HomeMoreController.h"
#import "MoreCell.h"
#import "FrequentMainViewController.h"
@interface HomeMoreController ()
{
    NSArray *imageArray;
    
}
@end

@implementation HomeMoreController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.arr = [NSArray arrayWithObjects:@"出行小秘书",@"我订阅的低价航线",@"航空公司常旅客专区",@"设置",@"社交账户绑定",@"新功能引导",@"关于我们", nil];
    
    self.navigationItem.title = @"更多";
    imageArray = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"icon_Assistant.png"],[UIImage imageNamed:@"icon_Assistant.png"],[UIImage imageNamed:@"icon_Flyer.png"],[UIImage imageNamed:@"icon_Setup.png"],[UIImage imageNamed:@"icon_Bind.png"],[UIImage imageNamed:@"icon_Guide.png"],[UIImage imageNamed:@"icon_aboutus.png"],nil];
    
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    else{
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MoreCell *cell = (MoreCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        [[NSBundle mainBundle] loadNibNamed:@"MoreCell" owner:self options:nil];
        
        cell = self.moreCell;
    }
    
    if (indexPath.section == 0) {
        cell.imaeView.image = [imageArray objectAtIndex:indexPath.row];
        cell.firstLabel.text = [_arr objectAtIndex:indexPath.row];
    }
    else{
        cell.firstLabel.text = [_arr objectAtIndex:indexPath.row + 3];
        cell.imaeView.image = [imageArray objectAtIndex:indexPath.row + 3];
    }
    
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSInteger selectIndex = indexPath.row;
    
    id controller = nil;
    
    
    if (indexPath.section==0) {
        switch (selectIndex) {
            case 0:
                
                CCLog(@"进入出行小秘书界面");
                
                
                break;
            case 1:
                CCLog(@"进入我订阅的低价航线界面");
                break;
            case 2:
                CCLog(@"进入航空公司常旅客专区界面");
                
                controller =[[FrequentMainViewController alloc] init];
                
                break;
            default:
                break;
        }
    }
    
    if (indexPath.section==1) {
        
        switch (selectIndex) {
            case 0:
                
                CCLog(@"进去设置界面");
                
                break;
            case 1:
                CCLog(@"进入社交账号绑定界面");
                
                break;
            case 2:
                CCLog(@"新功能引导页");
                break;
            case  3:
                CCLog(@"关于我们");
                break;
            default:
                break;
        }
        
    }
    
    
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
    
}

- (void)dealloc {
    [_moreCell release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setMoreCell:nil];
    [super viewDidUnload];
}
@end
