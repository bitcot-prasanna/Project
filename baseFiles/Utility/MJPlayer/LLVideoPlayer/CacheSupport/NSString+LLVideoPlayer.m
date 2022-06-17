//
//  NSString+LLVideoPlayer.m
//  Pods
//
//  Created by mario on 2017/2/23.
//
//

#import "NSString+LLVideoPlayer.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (LLVideoPlayer)

- (NSString *)ll_md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)ll_decodeLengthFromContentRange
{
    // For example: "Content-Range" = "bytes 57933824-57999359/65904318"
    
    NSArray *ranges = [self componentsSeparatedByString:@"/"];
    if (ranges.count > 0) {
        NSString *result = [[ranges lastObject] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if (result.length == 0) {
            return nil;
        }
        
        return result;
    }
    return nil;
}

- (NSRange)ll_decodeRangeFromContentRange
{
    NSArray *ranges = [self componentsSeparatedByString:@"/"];
    if (ranges.count == 0) {
        return NSMakeRange(NSNotFound, 0);
    }
    ranges = [ranges[0] componentsSeparatedByString:@" "];
    if (ranges.count < 2) {
        return NSMakeRange(NSNotFound, 0);
    }
    NSString *rangeString = [ranges[1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    ranges = [rangeString componentsSeparatedByString:@"-"];
    if (ranges.count != 2) {
        return NSMakeRange(NSNotFound, 0);
    }
    NSInteger start = [ranges[0] integerValue];
    NSInteger end = [ranges[1] integerValue];
    
    return NSMakeRange(start, end - start + 1);
}

@end
