//
//  ViewController.m
//  testNewWCDB
//
//  Created by TiltWang on 2017/9/18.
//  Copyright © 2017年 tilt. All rights reserved.
//

#import "ViewController.h"
#import "TWPerson.h"
#import "TWPersonDatabase.h"
#import "TWTableViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)btnClick:(UIButton *)btn {
    NSLog(@"%zd", btn.tag);
    switch (btn.tag) {
        case 1://创建表
        {
            [TWPersonDatabase creatDatabase];
        }
            break;
        case 2://查询
        {
            [self getDB];
        }
            break;
        case 3://添加
        {
            [self addPerson];
        }
            break;
        case 4://删除表
        {
            [TWPersonDatabase dropTable];
        }
            break;
            
        default:
            break;
    }
}
- (void)getDB {
    NSArray *array = [TWPersonDatabase getAllData];
    TWTableViewController *vc = [[TWTableViewController alloc] init];
    vc.modelList = array;
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)setupUI {
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 4;
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 60, width, 40)];
    btn1.tag = 1;
    [btn1 setTitle:@"创建表" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(width, 60, width, 40)];
    btn2.tag = 2;
    [btn2 setTitle:@"查询" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(width * 2, 60, width, 40)];
    btn3.tag = 3;
    [btn3 setTitle:@"添加" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(width * 3, 60, width, 40)];
    btn4.tag = 4;
    [btn4 setTitle:@"删除表" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

}

- (void)addPerson {
    TWPerson *person = [[TWPerson alloc] init];
    person.name = [NSString stringWithFormat:@"小王"];
    person.age = 18;
    person.title = @"组长";
    person.title = @"小孩";
    person.nickname = @"星星点灯";
    [TWPersonDatabase insertData:person];
}


@end
