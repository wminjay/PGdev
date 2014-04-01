//
//  LYAutoLayoutMainViewController.m
//  PGdev
//
//  Created by Gin on 14-1-23.
//  Copyright (c) 2014年 Gin. All rights reserved.
//

#import "LYAutoLayoutMainViewController.h"
#import "ASIHTTPRequest.h"
#import "GCDAsyncSocket.h"
#import "AsyncSocket.h"
#import "SRWebSocket.h"
#import <AVFoundation/AVFoundation.h>

@interface LYAutoLayoutMainViewController () <ASIProgressDelegate, ASIHTTPRequestDelegate, NSURLConnectionDataDelegate, SRWebSocketDelegate, UITextViewDelegate, JSDismissiveTextViewDelegate, UITextViewDelegate, AVAudioPlayerDelegate, AVAudioRecorderDelegate> {
    
    CFReadStreamRef rStream;
    CFWriteStreamRef wStream;
    
    NSInputStream *iStream;
    NSOutputStream *oStream;
    
    
    SRWebSocket *webSocket;

}

@property (assign, nonatomic) CGFloat previousTextViewContentHeight;
@property (assign, nonatomic) BOOL isUserScrolling;

@property (nonatomic, strong) NSMutableData * responseData;
@property (nonatomic, strong) NSURLConnection *connection;

@property (weak, nonatomic, readonly) JSMessageInputView *messageInputView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AVAudioRecorder *myRecorder;

@end

@implementation LYAutoLayoutMainViewController


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"fd"]) {
        DLog(@"change:%@",change);
//        [self layoutAndAnimateMessageInputTextView:object];
    }
}


#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    UITextView *inputView = [[UITextView alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    inputView.delegate = self;
    inputView.backgroundColor = [UIColor redColor];
    [self.view addSubview:inputView];
    [inputView addObserver:self
                                     forKeyPath:@"contentSize"
                                        options:NSKeyValueObservingOptionNew
                                        context:nil];

    return;
//    [self configView];
//    [self setup];
    
    NSLog(@"LYAutoLayoutMainViewController........");

//    NSString *soundFilePath = @"33.aud";
//    
//    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc]init];
//    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatAMR] forKey:AVFormatIDKey];
//
//    
//    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
//    
//    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
//                                           error: nil];
//    
//    
//    
//    [newPlayer prepareToPlay];
//    [newPlayer setDelegate: self];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    NSError *sessionError;
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
    
    if(session == nil)
        NSLog(@"Error creating session: %@", [sessionError description]);
    else
        [session setActive:YES error:nil];

    
    
    
    NSMutableDictionary* recordSetting = [[NSMutableDictionary alloc] init];
    [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatAppleIMA4] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSURL *recordedTmpFile = [NSURL fileURLWithPath:[documentsDirectory stringByAppendingPathComponent: [NSString stringWithFormat: @"test%d.%@",01, @"caf"]]];
//    NSString *str = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"voice.amr"];
//    NSURL *recordedTmpFile = [[NSURL alloc] initFileURLWithPath:str];
    
    NSError *playerError;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:recordedTmpFile error:&playerError];
    if (player == nil)
    {
        NSLog(@"ERror creating player: %@", [playerError description]);
    }
    player.delegate = self;
    [player play];
    
//    NSError *error;
//    AVAudioRecorder *recorder = [[ AVAudioRecorder alloc] initWithURL:recordedTmpFile settings:recordSetting error:&error];
//    [recorder setDelegate:self];
//    [recorder prepareToRecord];
//    [recorder record];
//    NSLog(@"Error: %@", [error description]);
//    self.myRecorder = recorder;
    
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    
}

/* if an error occurs while encoding it will be reported to the delegate. */
- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    
}
- (void) audioPlayerDidFinishPlaying: (AVAudioPlayer *) player
                        successfully: (BOOL) completed {


}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(handleWillShowKeyboardNotification:)
												 name:UIKeyboardWillShowNotification
                                               object:nil];
    
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(handleWillHideKeyboardNotification:)
												 name:UIKeyboardWillHideNotification
                                               object:nil];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [self.myRecorder stop];
}

- (void)setup
{
    _isUserScrolling = NO;
    
    CGSize size = self.view.frame.size;
    
    JSMessageInputViewStyle inputViewStyle = JSMessageInputViewStyleFlat;
    CGFloat inputViewHeight = (inputViewStyle == JSMessageInputViewStyleFlat) ? 45.0f : 40.0f;
    
    CGRect inputFrame = CGRectMake(0.0f,
                                   size.height - inputViewHeight,
                                   size.width,
                                   inputViewHeight);

    CGRect tableFrame = CGRectMake(0.0f, 0.0f, size.width, size.height - inputViewHeight);
	UITableView *tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.tableView = tableView;
	tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    UIPanGestureRecognizer *pan =  tableView.panGestureRecognizer;
    
    JSMessageInputView *inputView = [[JSMessageInputView alloc] initWithFrame:inputFrame
                                                                        style:inputViewStyle
                                                                     delegate:self
                                                         panGestureRecognizer:pan];
    
    [self.view addSubview:inputView];
    _messageInputView = inputView;
    
    [_messageInputView.textView addObserver:self
                                 forKeyPath:@"contentSize"
                                    options:NSKeyValueObservingOptionNew
                                    context:nil];

    
}


- (void)handleTapGestureRecognizer:(UITapGestureRecognizer *)tap
{
    [self.messageInputView.textView resignFirstResponder];
}


#pragma mark - Text view delegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [textView becomeFirstResponder];
	
    if (!self.previousTextViewContentHeight)
		self.previousTextViewContentHeight = textView.contentSize.height;
    
//    [self scrollToBottomAnimated:YES];
}

- (void)textViewDidChange:(UITextView *)textView
{
    self.messageInputView.sendButton.enabled = ([[textView.text js_stringByTrimingWhitespace] length] > 0);
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
}


#pragma mark - Layout message input view

- (void)layoutAndAnimateMessageInputTextView:(UITextView *)textView
{
    CGFloat maxHeight = [JSMessageInputView maxHeight];
    
    BOOL isShrinking = textView.contentSize.height < self.previousTextViewContentHeight;
    CGFloat changeInHeight = textView.contentSize.height - self.previousTextViewContentHeight;
    
    if (!isShrinking && (self.previousTextViewContentHeight == maxHeight || textView.text.length == 0)) {
        changeInHeight = 0;
    }
    else {
        changeInHeight = MIN(changeInHeight, maxHeight - self.previousTextViewContentHeight);
    }
    
    if (changeInHeight != 0.0f) {
        [UIView animateWithDuration:0.25f
                         animations:^{
                             [self setTableViewInsetsWithBottomValue:self.tableView.contentInset.bottom + changeInHeight];
                             
                             [self scrollToBottomAnimated:NO];
                             
                             if (isShrinking) {
                                 // if shrinking the view, animate text view frame BEFORE input view frame
                                 [self.messageInputView adjustTextViewHeightBy:changeInHeight];
                             }
                             
                             CGRect inputViewFrame = self.messageInputView.frame;
                             self.messageInputView.frame = CGRectMake(0.0f,
                                                                      inputViewFrame.origin.y - changeInHeight,
                                                                      inputViewFrame.size.width,
                                                                      inputViewFrame.size.height + changeInHeight);
                             
                             if (!isShrinking) {
                                 // growing the view, animate the text view frame AFTER input view frame
                                 [self.messageInputView adjustTextViewHeightBy:changeInHeight];
                             }
                         }
                         completion:^(BOOL finished) {
                         }];
        
        self.previousTextViewContentHeight = MIN(textView.contentSize.height, maxHeight);
    }
    
    // Once we reached the max height, we have to consider the bottom offset for the text view.
    // To make visible the last line, again we have to set the content offset.
    if (self.previousTextViewContentHeight == maxHeight) {
        double delayInSeconds = 0.01;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime,
                       dispatch_get_main_queue(),
                       ^(void) {
                           CGPoint bottomOffset = CGPointMake(0.0f, textView.contentSize.height - textView.bounds.size.height);
                           [textView setContentOffset:bottomOffset animated:YES];
                       });
    }
}

#pragma mark - Key-value observing

//- (void)observeValueForKeyPath:(NSString *)keyPath
//                      ofObject:(id)object
//                        change:(NSDictionary *)change
//                       context:(void *)context
//{
//    if (object == self.messageInputView.textView && [keyPath isEqualToString:@"contentSize"]) {
//        [self layoutAndAnimateMessageInputTextView:object];
//    }
//}

#pragma mark - Keyboard notifications

- (void)handleWillShowKeyboardNotification:(NSNotification *)notification
{
    [self keyboardWillShowHide:notification];
}

- (void)handleWillHideKeyboardNotification:(NSNotification *)notification
{
    [self keyboardWillShowHide:notification];
}

- (void)keyboardWillShowHide:(NSNotification *)notification
{
    CGRect keyboardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
	UIViewAnimationCurve curve = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
	double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:[self animationOptionsForCurve:curve]
                     animations:^{
                         CGFloat keyboardY = [self.view convertRect:keyboardRect fromView:nil].origin.y;
                         
                         CGRect inputViewFrame = self.messageInputView.frame;
                         CGFloat inputViewFrameY = keyboardY - inputViewFrame.size.height;
                         
                         // for ipad modal form presentations
                         CGFloat messageViewFrameBottom = self.view.frame.size.height - inputViewFrame.size.height;
                         if (inputViewFrameY > messageViewFrameBottom)
                             inputViewFrameY = messageViewFrameBottom;
						 
                         self.messageInputView.frame = CGRectMake(inputViewFrame.origin.x,
																  inputViewFrameY,
																  inputViewFrame.size.width,
																  inputViewFrame.size.height);
                         
                         [self setTableViewInsetsWithBottomValue:self.view.frame.size.height
                          - self.messageInputView.frame.origin.y
                          - inputViewFrame.size.height];
                     }
                     completion:nil];
}

- (void)setTableViewInsetsWithBottomValue:(CGFloat)bottom
{
    UIEdgeInsets insets = [self tableViewInsetsWithBottomValue:bottom];
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
}

- (UIEdgeInsets)tableViewInsetsWithBottomValue:(CGFloat)bottom
{
    UIEdgeInsets insets = UIEdgeInsetsZero;
    
    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        insets.top = self.topLayoutGuide.length;
    }
    
    insets.bottom = bottom;
    
    return insets;
}

#pragma mark - Dismissive text view delegate

- (void)keyboardDidScrollToPoint:(CGPoint)point
{
    CGRect inputViewFrame = self.messageInputView.frame;
    CGPoint keyboardOrigin = [self.view convertPoint:point fromView:nil];
    inputViewFrame.origin.y = keyboardOrigin.y - inputViewFrame.size.height;
    self.messageInputView.frame = inputViewFrame;
}

- (void)keyboardWillBeDismissed
{
    CGRect inputViewFrame = self.messageInputView.frame;
    inputViewFrame.origin.y = self.view.bounds.size.height - inputViewFrame.size.height;
    self.messageInputView.frame = inputViewFrame;
}

- (void)keyboardWillSnapBackToPoint:(CGPoint)point
{
    if (!self.tabBarController.tabBar.hidden){
        return;
    }
	
    CGRect inputViewFrame = self.messageInputView.frame;
    CGPoint keyboardOrigin = [self.view convertPoint:point fromView:nil];
    inputViewFrame.origin.y = keyboardOrigin.y - inputViewFrame.size.height;
    self.messageInputView.frame = inputViewFrame;
}

#pragma mark - Utilities

- (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve
{
    switch (curve) {
        case UIViewAnimationCurveEaseInOut:
            return UIViewAnimationOptionCurveEaseInOut;
            
        case UIViewAnimationCurveEaseIn:
            return UIViewAnimationOptionCurveEaseIn;
            
        case UIViewAnimationCurveEaseOut:
            return UIViewAnimationOptionCurveEaseOut;
            
        case UIViewAnimationCurveLinear:
            return UIViewAnimationOptionCurveLinear;
            
        default:
            return kNilOptions;
    }
}

- (void)scrollToBottomAnimated:(BOOL)animated
{
	if (![self shouldAllowScroll])
        return;
	
    NSInteger rows = [self.tableView numberOfRowsInSection:0];
    
    if (rows > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:rows - 1 inSection:0]
                              atScrollPosition:UITableViewScrollPositionBottom
                                      animated:animated];
    }
}

- (BOOL)shouldAllowScroll
{
    return YES;
}

#pragma mark - Private Methods
- (void)configView
{
 
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.56:8080/register/0/0/"]];
    webSocket = [[SRWebSocket alloc] initWithURLRequest:urlRequest];
    webSocket.delegate = self;
    [webSocket open];
    return;
    
    GCDAsyncSocket *socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];

    NSError *err = nil;
    if (![socket connectToHost:@"http://192.168.1.56/register/0/0/" onPort:8080 error:&err]) // Asynchronous!
    {
        // If there was an error, it's likely something like "already connected" or "no delegate set"
        NSLog(@"I goofed: %@", err);
    }
    
    
    return;
    
    /*    NSString *urlStr = @"http://192.168.1.56:8080/regsiter/0/0/";
//    NSString *urlStr = @"http://127.0.0.1/";

    NSURL *url = [NSURL URLWithString:urlStr];
    self.responseData = [[NSMutableData alloc] initWithLength:0] ;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [request setValue:@"max-age=0" forHTTPHeaderField:@"Cache-Control"];

    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    return;
    */
    /*
    CFStringRef url = CFSTR("http://www.apple.com");
    CFURLRef myURL = CFURLCreateWithString(kCFAllocatorDefault, url, NULL);
    CFStringRef requestMethod = CFSTR("GET");
    
    CFHTTPMessageRef myRequest = CFHTTPMessageCreateRequest(kCFAllocatorDefault, requestMethod, myURL, kCFHTTPVersion1_1);
//    CFHTTPMessageSetBody(myRequest, bodyData);
//    CFHTTPMessageSetHeaderFieldValue(myRequest, headerField, value);
    
    CFReadStreamRef myReadStream = CFReadStreamCreateForHTTPRequest(kCFAllocatorDefault, myRequest);
    
    CFReadStreamOpen(myReadStream);
    */
    return;
//    NSURL *url = [NSURL URLWithString:@"http://192.168.1.56:8080/register/0/0/"];
    /*
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/"];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.timeOutSeconds = 30;
    [request addRequestHeader:@"Connection" value:@"keep-alive"];
    [request buildPostBody];
    [request setShouldAttemptPersistentConnection:YES];
    [request setDelegate:self];
    
    // persistent connections Demo
    [request setDataReceivedBlock:^(NSData *data) {
        DLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    
    [request setBytesReceivedBlock:^(unsigned long long length, unsigned long long total) {
        
	}];

//    [request startAsynchronous];
    
    
    
    NSMutableData *responseData = [[NSMutableData alloc] initWithLength:0] ;
    NSMutableURLRequest *requestC = [NSMutableURLRequest requestWithURL:url];
    [requestC setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:requestC delegate:self startImmediately:YES];
    */
}

#pragma mark - Public Methods



#pragma mark - SRWebSocketDelegate

- (void)webSocketDidOpen:(SRWebSocket *)webSocket;
{
    NSLog(@"Websocket Connected");
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;
{
    NSLog(@":( Websocket Failed With Error %@", error);
    
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;
{
    NSLog(@"Received \"%@\"", message);
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean;
{
    NSLog(@"WebSocket closed");
}



- (void)socket:(GCDAsyncSocket *)sender didConnectToHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"Cool, I'm connected! That was easy.");
}


- (void)socket:(GCDAsyncSocket *)sender didReadData:(NSData *)data withTag:(long)tag
{
    
    
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    
    
}


/*
- (void)request:(ASIHTTPRequest *)request didReceiveData:(NSData *)data
{
    DLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    DLog(@"%@", connection);
    DLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.responseData setLength:0];
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode
{
    NSLog(@"stream:handleEvent: is invoked...");
    
    switch(eventCode) {
        case NSStreamEventHasSpaceAvailable:
        {
            
            break;
        }
        case NSStreamEventHasBytesAvailable: {
			if(stream == iStream) {
				NSLog(@"inputStream is ready.");
				
				uint8_t buf[1024];
				unsigned int len = 0;
				
				len = [iStream read:buf maxLength:1024];
				
				if(len > 0) {
					NSMutableData* data=[[NSMutableData alloc] initWithLength:0];
					
					[data appendBytes: (const void *)buf length:len];
					
					NSString *s = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
					
//					[self readIn:s];
//					[data release];
				}
			} else if (stream == oStream) {
             
                
            }
            
			break;
		}
    }
}
*/
@end
