// AFAppDotNetAPIClient.h
//
// Copyright (c) 2011–2016 Alamofire Software Foundation ( http://alamofire.org/ )
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "VitNetAPIClient.h"


@implementation VitNetAPIClient

+ (instancetype)sharedClient
{
    static VitNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        _sharedClient                           = [[VitNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:URL_BASE]];
        _sharedClient.securityPolicy            = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });

    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)_url
{
    self = [super initWithBaseURL:_url];
    if (self)
    {
        [self initialHttp:nil respone:nil];
    }
    return self;
}

- (void)initialHttp:(AFHTTPRequestSerializer*)request respone:(AFHTTPResponseSerializer*)respone
{
    AFHTTPRequestSerializer* request_form   = [AFHTTPRequestSerializer serializer];
    request_form.timeoutInterval            = 30;
    self.requestSerializer                  = request_form;

    AFJSONResponseSerializer* response_json = [AFJSONResponseSerializer serializer];
    self.responseSerializer                 = response_json;
}

@end
