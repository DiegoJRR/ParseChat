//
//  LoginViewController.m
//  ParseChat
//
//  Created by Diego de Jesus Ramirez on 06/07/20.
//  Copyright © 2020 DiegoRamirez. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)signUp:(id)sender {
    
    if (self.usernameField.hasText && self.passwordField.hasText) {
        // initialize a user object
        PFUser *newUser = [PFUser user];
        
        // set user properties
        newUser.username = self.usernameField.text;
        newUser.password = self.passwordField.text;

        // call sign up function on the object
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
            if (error != nil) {
                NSLog(@"Error: %@", error.localizedDescription);
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message: error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                    // Ok action example
                }];
                [alert addAction:okAction];
                [self presentViewController:alert animated:YES completion:nil];
                
            } else {
                NSLog(@"User registered successfully");

                // manually segue to logged in view
            }
        }];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing information" message:@"Please fill in your username and password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            // Ok action example
        }];
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            // Other action
        }];
        [alert addAction:okAction];
        [alert addAction:otherAction];
        [self presentViewController:alert animated:YES completion:nil];
    }

}

- (IBAction)login:(id)sender {
    
    if (self.usernameField.hasText && self.passwordField.hasText) {
        NSString *username = self.usernameField.text;
        NSString *password = self.passwordField.text;
        
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
            if (error != nil) {
                NSLog(@"User log in failed: %@", error.localizedDescription);
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message: error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                    // Ok action example
                }];
                [alert addAction:okAction];
                [self presentViewController:alert animated:YES completion:nil];
                
            } else {
                NSLog(@"User logged in successfully");
                
                // display view controller that needs to shown after successful login
            }
        }];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing information" message:@"Please fill in your username and password" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            // Ok action example
        }];
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            // Other action
        }];
        [alert addAction:okAction];
        [alert addAction:otherAction];
        [self presentViewController:alert animated:YES completion:nil];
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
