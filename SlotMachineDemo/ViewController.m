//
//  ViewController.m
//  SlotMachineDemo
//
//  Created by Xinling on 26/2/15.
//  Copyright (c) 2015 Xinling. All rights reserved.
//

#import "ViewController.h"
#import "SlotView.h"

@interface ViewController ()<SlotViewDelegate>
@property (nonatomic, strong) UIButton* startButton;
@property (nonatomic, strong) SlotView* slotView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray* images = @[[UIImage imageNamed:@"sloticons1"],
                        [UIImage imageNamed:@"sloticons2"],
                        [UIImage imageNamed:@"sloticons3"],
                        [UIImage imageNamed:@"sloticons4"],
                        [UIImage imageNamed:@"sloticons5"],
                        [UIImage imageNamed:@"sloticons6"]];
    
    SlotView* slotItem = [[SlotView alloc] initWithNumberOfComponents:3];
    slotItem.frame = CGRectMake(10, 300, 300, 120);
    slotItem.slotImages = images;
    slotItem.delegate = self;
    [self.view addSubview:slotItem];
    self.slotView = slotItem;
    
    {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(100, 200, 130, 95);
        [button addTarget:self action:@selector(startSlotMachine) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button setImage:[UIImage imageNamed:@"start_btn_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"start_btn_disable"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"start_btn_disable"] forState:UIControlStateDisabled];
        self.startButton = button;
    }
    
    {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(200, 200, 50, 25);
        [button setTitle:@"停止" forState:UIControlStateNormal];
        [button addTarget:slotItem action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}


- (void)startSlotMachine
{
    [self.slotView start];
    self.startButton.enabled = NO;
}


#pragma mark - slotView Delegate
- (NSInteger)slotView:(SlotView *)slotView selectedRowInComponent:(NSInteger)component
{
    return random() % slotView.numberOfComponents;
}

- (void)stopCompleteInSlotView:(SlotView *)slotView
{
    self.startButton.enabled = YES;
}


@end
