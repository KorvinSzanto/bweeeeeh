#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "BWAppDelegate.h"
int main(int argc, char *argv[]){
    [NSApp setDelegate: [BWAppDelegate new]];
    return NSApplicationMain(argc, (const char **)argv);
}
