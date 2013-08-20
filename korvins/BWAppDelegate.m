#import "BWAppDelegate.h"

@implementation BWAppDelegate {
    NSSound *bweeh;
}

- (void)dealloc {
    [self.window release];
    [bweeh release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSButton *button = [[NSButton alloc] initWithFrame:CGRectMake(10, 10, 50, 30)];
    button.title = @"Bweeh";
    button.target = self;
    button.action = @selector(buttonPressed:);
    
    bweeh = [[NSSound alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bweeeeeh" ofType:@"wav"] byReference:YES];
    [self.window.contentView addSubview:button];
    [self.window orderFrontRegardless];
}

- (void)buttonPressed:(id)sender {
    NSLog(@"Pressed button");
    if ([bweeh isPlaying]) {
        [bweeh stop];
    }
    [bweeh play];
}

@end
