//
//  ViewController.m
//  Contacts
//
//  Created by Tomek Buslowski on 31.08.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-Swift.h"

@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        Contact *c1 = [[Contact alloc] initWithContactName:@"Ala Kotka"];
        _contacts = [NSMutableArray arrayWithArray:@[c1]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: @"UITableViewCell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    Contact *contact = self.contacts[indexPath.row];
    
    cell.textLabel.text = contact.name;
    
    return cell;
}

- (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)segue
{
    // cancel
}

- (IBAction)createNewContact:(UIStoryboardSegue *)segue
{
    NewContactViewController *newContactVC = segue.sourceViewController;
    NSString *name = newContactVC.nameTextField.text;
    NSString *surname = newContactVC.surnameTextField.text;
    if (name.length > 0 || surname.length >0) {
        NSString *contactName = [NSString stringWithFormat:@"%@ %@", name, surname];
        Contact *newContact = [[Contact alloc] initWithContactName:contactName];
        
        [self.contacts addObject:newContact];
        [self.tableView reloadData];
    }
}

@end
