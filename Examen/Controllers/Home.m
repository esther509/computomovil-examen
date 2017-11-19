//
//  ViewController.m
//  Examen
//
//  Created by Laura Lopez on 11/15/17.
//  Copyright © 2017 UAG. All rights reserved.
//

#import "Home.h"
#import "Constants.h"
#import "WebServices.h"
#import "SWPersonCell.h"

@interface Home ()
@property NSMutableArray *matches;
@property NSMutableArray *userImgs;
@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _matches = [[NSMutableArray alloc] init];
    [self initController];
    [self refreshGames];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initController{
    self.userImgs =[[NSMutableArray alloc] initWithObjects:
                    [UIImage imageNamed:@"Aguilas.png"],
                    [UIImage imageNamed:@"Cañeros.png"],
                    [UIImage imageNamed:@"Charros.jpeg"],
                    [UIImage imageNamed:@"Mayos.png"],
                    [UIImage imageNamed:@"Naranjeros.png"],
                    [UIImage imageNamed:@"Tomateros.png"],
                    [UIImage imageNamed:@"Venados.png"],
                    [UIImage imageNamed:@"Yaquis.png"], nil ];
    
    
}

- (IBAction)btnRefreshPressed:(id)sender {
    [self refreshGames];
}

-(void) refreshGames {
    if([UIApplication sharedApplication].networkActivityIndicatorVisible)
        return;
    
    [_matches removeAllObjects];
    [self.tableView reloadData];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getGames:^(NSMutableArray<SWObject> *matches) {
        if(matches){
            [_matches addObjectsFromArray:matches];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.tableView reloadData];
        
    }];
}

#pragma mark - Table

- (NSInteger)numberOfSectionTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.matches count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 115;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    SWPersonCell *cell = (SWPersonCell *)[tableView dequeueReusableCellWithIdentifier:@"SWPersonCell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"SWPersonCell" bundle:nil] forCellReuseIdentifier:@"SWPersonCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"SWPersonCell"];
    }
    
    //Fill cell with info from arrays
    SWObject *game = [self.matches objectAtIndex:[indexPath row]];
    cell.labelTeam1.text = game.home_name;
    cell.labelTeam2.text = game.away_name;
    cell.labelTime.text = game.startTime;
    
    if([game.home_name isEqualToString:@"Águilas"])
    {
        cell.imageViewTeam1.image = self.userImgs[0];
    }
    else if([game.home_name isEqualToString:@"Cañeros"])
    {
        cell.imageViewTeam1.image = self.userImgs[1];
    }
    else if([game.home_name isEqualToString:@"Charros"])
    {
        cell.imageViewTeam1.image = self.userImgs[2];
    }
    else if([game.home_name isEqualToString:@"Mayos"])
    {
        cell.imageViewTeam1.image = self.userImgs[3];
    }
    else if([game.home_name isEqualToString:@"Naranjeros"])
    {
        cell.imageViewTeam1.image = self.userImgs[4];
    }
    else if([game.home_name isEqualToString:@"Tomateros"])
    {
        cell.imageViewTeam1.image = self.userImgs[5];
    }
    else if([game.home_name isEqualToString:@"Venados"])
    {
        cell.imageViewTeam1.image = self.userImgs[6];
    }
    else if([game.home_name isEqualToString:@"Yaquis"])
    {
        cell.imageViewTeam1.image = self.userImgs[7];
    }
    
    if([cell.labelTeam2.text isEqualToString:@"Águilas"])
    {
        cell.imageViewTeam2.image = self.userImgs[0];
    }
    else if([cell.labelTeam2.text isEqualToString:@"Cañeros"])
    {
        cell.imageViewTeam2.image = self.userImgs[1];
    }
    else if([cell.labelTeam2.text isEqualToString:@"Charros"])
    {
        cell.imageViewTeam2.image = self.userImgs[2];
    }
    else if([cell.labelTeam2.text isEqualToString:@"Mayos"])
    {
        cell.imageViewTeam2.image = self.userImgs[3];
    }
    else if([cell.labelTeam2.text isEqualToString:@"Naranjeros"])
    {
        cell.imageViewTeam2.image = self.userImgs[4];
    }
    else if([cell.labelTeam2.text isEqualToString:@"Tomateros"])
    {
        cell.imageViewTeam2.image = self.userImgs[5];
    }
    else if([cell.labelTeam2.text isEqualToString:@"Venados"])
    {
        cell.imageViewTeam2.image = self.userImgs[6];
    }
    else if([cell.labelTeam2.text isEqualToString:@"Yaquis"])
    {
        cell.imageViewTeam2.image = self.userImgs[7];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end

