//
//  ViewController.m
//  USStates
//
//  Created by Langston Duncanson on 10/30/17.
//  Copyright © 2017 Langston Duncanson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)NSArray *states;
@property (nonatomic, strong)NSArray *capitals;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.states = @[@"Alabama", @"Alaska", @"Arizona" ,@"Arkansas" ,@"California" , @"Colorado",@"Connecticut",@"Delaware",@"Florida",@"Georgia",@"Hawaii", @"Idaho" , @"Illinois" , @"Indiana" , @"Iowa" , @"Kansas" , @"Kentucky" , @"Louisiana" , @"Montana" , @"Nebraska" , @"Nevada" , @"New Hampshire" , @"New Jersey" , @"New Mexico" , @"New York"];
    self.capitals = @[@"Montgomery" , @"Juneau", @"Phoenix", @"Little Rock",@"Sacramento",@"Denver",@"Hartford" , @"Dover" , @"Tallahassee" , @"Atlanta" , @"Honolulu" , @"Boise" , @"Springfield" , @"Indianapolis" , @"Des Moines",@"Topeka" , @"Frankfort" , @"Baton Rouge" , @"Helena" , @"Lincoln",@"Carson City",@"Concord",@"Trenton",@"Santa fe",@"Albany"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.states count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // define the type of table cell
    static NSString* simpleTableIdentifer =@"SimpleTableIdentifier";
    // ask the table to reuse previously used cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: simpleTableIdentifer];
    
    // if we need to re-create a reusable cell, we test
    // to see if it is nil
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifer];
    }
    UIImage *image = [UIImage imageNamed:@"usa"];
    cell.imageView.image = image;
    
    UIImage *highlightedImage = [UIImage imageNamed:@"usapressed"];
    cell.imageView.highlightedImage = highlightedImage;

    
    cell.textLabel.text = self.states[indexPath.row];
    cell.detailTextLabel.text = self.capitals[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *rowState = self.states[indexPath.row];
    NSString *rowCapital = self.capitals[indexPath.row];
    
    NSString *message = [[NSString alloc]initWithFormat:@"You selected State is %@ and the capital is %@", rowState, rowCapital];
    
    //Show Alert
    
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Selected State"
                               message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    

    [defaultAction setValue:[[UIImage imageNamed:@"usa"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forKey:@"image"];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"%@",message);
    
    // dismiss row selection
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
