#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface MyDelegate : NSObject
{
	NSWindow *mainWindow;
	NSSound *bweeeeeh;
}
- (void) createWindow;
- (void) playBweeeeeh: (id)sender;
- (void) applicationWillFinishLaunching: (NSNotification *)not;
- (void) applicationDidFinishLaunching: (NSNotification *)not;
- (BOOL) applicationShouldTerminateAfterLastWindowClosed: (NSApplication *)sender;
@end

@implementation MyDelegate : NSObject
- (void) dealloc
{
	[mainWindow release];
	[bweeeeeh release];
	[super dealloc];
}

- (void) createWindow
{
	mainWindow = [NSWindow alloc];
	bweeeeeh = [NSSound alloc];

	NSString *bweeeeehPath = [[NSBundle mainBundle] pathForResource: @"bweeeeeh"
	                                                ofType: @"wav"];
	[bweeeeeh initWithContentsOfFile: bweeeeehPath byReference: YES];

	NSButton *talkButton;

	talkButton = [NSButton new];
	[talkButton setTitle: @"Bweeeeeh!"];
	[talkButton setFont: [NSFont systemFontOfSize: 42.0]];
	[talkButton setTarget: self];
	[talkButton setAction: @selector (playBweeeeeh:)];

	mainWindow = [mainWindow initWithContentRect: NSMakeRect (100, 100, 400, 200)
	                         styleMask: NSTitledWindowMask
	                                    | NSMiniaturizableWindowMask
	                         backing: NSBackingStoreBuffered
	                         defer: NO];

	[mainWindow setTitle: @"Bweeeeeh"];
	[mainWindow setContentView: talkButton];
	[talkButton release];
}

- (void) applicationWillFinishLaunching: (NSNotification *)not;
{
	[self createWindow];
}

- (void) applicationDidFinishLaunching: (NSNotification *)not;
{
	[mainWindow makeKeyAndOrderFront: nil];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed: (NSApplication *)sender
{
	printf("Hey you\n");
NSLog(@"SDASDA");
	return YES;
}

- (void) playBweeeeeh: (id)sender
{
	if ([bweeeeeh isPlaying]) {
		[bweeeeeh setCurrentTime: 0];
	} else {
		[bweeeeeh play];
	}
}
@end

int
main (int argc, const char **argv)
{
	[NSApplication sharedApplication];
	[NSApp setDelegate: [MyDelegate new]];

	return NSApplicationMain (argc, argv);
}
