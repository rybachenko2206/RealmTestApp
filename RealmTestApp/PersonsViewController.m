//
//  PersonsViewController.m
//  RealmTestApp
//
//  Created by Roman Rybachenko on 6/6/16.
//  Copyright © 2016 Roman Rybachenko. All rights reserved.
//


#import <Realm/Realm.h>
#import "Dog.h"
#import "Person.h"
#import "PersonTableViewCell.h"
#import "RLMResults+ToNSArray.h"

#import "PersonsViewController.h"


@interface PersonsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *items;

@end


@implementation PersonsViewController


#pragma mark - Overriden methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fillDB];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    RLMResults<Person *> *persons = [Person allObjects];
    
    self.items = [[persons toArray] mutableCopy];
    [self.tableView reloadData];
}


#pragma mark - Delegate methods:

#pragma mark —UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PersonTableViewCell cellIdentifier] forIndexPath:indexPath];
    cell.person = self.items[indexPath.row];
    
    return cell;
}


#pragma mark - Private methods

- (void)fillDB {
    Person *jack = [[Person alloc] init];
    jack.firstName = @"Jack";
    jack.lastName = @"Barton";
    jack.age = 21;
    
//    Person *mary = [[Person alloc] initWithValue:@{@"fistName" : @"Mary", @"lastName" : @"Simpson", @"age" : @27, }];   // тут мав бути креш, бо 'age' у нас NSIngeger, a його в словник не покладеш )))
    
    Person *mary = [[Person alloc] init];
    mary.firstName = @"Mary";
    mary.lastName = @"Simpson";
    mary.age = 27;
    
    Dog *mydog = [[Dog alloc] init];
    mydog.name = @"Rex";
    mydog.age = 2;
    mydog.picture = nil; 
    NSLog(@"Name of dog: %@", mydog.name);
    mydog.owner = mary;
    
    Dog *mydog2 = [[Dog alloc] init];
    mydog2.name = @"Jack";
    mydog2.age = 4;
    mydog2.picture = nil;
    mydog2.owner = jack;
    
    RLMRealm *realmDB = [RLMRealm defaultRealm];
    NSURL *dbURL = [RLMRealmConfiguration defaultConfiguration].fileURL;
    NSLog(@"\n~~realmDB file URL -> \n %@", dbURL);
    
    // WRITE TO DB  EXAMPLE №1
    [realmDB beginWriteTransaction];
    [realmDB addObject:mydog];
    [realmDB commitWriteTransaction];
    
    
    // WRITE TO DB  EXAMPLE №2
    [realmDB transactionWithBlock:^{
        [realmDB addObject:mydog2];
    }];
}


#pragma mark - Static methods

+ (NSString *)storyboardIdentifier {
    return [[PersonsViewController class] description];
}

@end
