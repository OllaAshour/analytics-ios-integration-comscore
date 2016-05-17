//
//  Segment-ComScoreTests.m
//  Segment-ComScoreTests
//
//  Created by wcjohnson11 on 05/16/2016.
//  Copyright (c) 2016 wcjohnson11. All rights reserved.
//

// https://github.com/Specta/Specta

SpecBegin(InitialSpecs)

describe(@"SEGComScoreIntegrationFactory", ^{
    it(@"factory creates integration with empty settings", ^{
        SEGComScoreIntegration *integration = [[SEGComScoreIntegrationFactory instance] createWithSettings:@{} forAnalytics:nil];
        
        expect(integration.settings).to.equal(@{});
    });
});

describe(@"SEGComScoreIntegrationFactory", ^{
    it(@"factory creates integration with basic settings", ^{
        SEGComScoreIntegration *integration = [[SEGComScoreIntegrationFactory instance] createWithSettings:@{
            @"customerC2" : @"1234567",
            @"publisherSecret": @"publisherSecretString",
            @"setSecure": @"1",
            @"autoUpdateInterval": @"background"
        } forAnalytics:nil];
        
        expect(integration.settings).to.equal(@{
            @"customerC2": @"1234567",
            @"publisherSecret": @"publisherSecretString",
            @"setSecure": @"1",
            @"autoUpdateInterval": @"background"
        }); 
    });
});

describe(@"SEGComScoreIntegration", ^{
    __block Class mockComScore;
    __block SEGComScoreIntegration *integration;
    
    beforeEach(^{
        mockComScore = mockClass([CSComScore class]);
        integration = [[SEGComScoreIntegration alloc] initWithSettings:@{} andCSComScore: mockComScore];
    });
    
    it(@"identify with Traits", ^{
        SEGIdentifyPayload *payload = [[SEGIdentifyPayload alloc] initWithUserId:@"1111"
                                                                     anonymousId:nil
                                                                          traits:@{@"name":@"Kylo Ren",
                                                                                   @"gender": @"male",
                                                                                   @"emotion": @"angsty"}
                                                                         context:@{} integrations:@{}];
        
        [integration identify:payload];
        
        [verify(mockComScore) setLabel: @"name" value: @"Kylo Ren"];
        [verify(mockComScore) setLabel: @"gender" value: @"male"];
        [verify(mockComScore) setLabel: @"emotion" value: @"angsty"];
    });
    
    it(@"track with props", ^{
//        SEGTrackPayload *payload = [[SEGTrackPayload alloc] initWithEvent:@"Starship Ordered" properties:@{@"Starship Type": @"Death Star"} context:@{} integrations:@{}];
//        
//        [integration track:payload];
//        
//        [verify(mockTaplytics) logEvent:@"Starship Ordered" value:nil metaData:@{@"Starship Type": @"Death Star"}];
    });
    
    it(@"track with revenue", ^{
//        SEGTrackPayload *payload = [[SEGTrackPayload alloc] initWithEvent:@"Starship Bought" properties:@{@"revenue": @20000} context:@{} integrations:@{}];
//        
//        [integration track:payload];
//        
//        [verify(mockTaplytics) logRevenue:@"Starship Bought" revenue:@20000 metaData:@{}];
    });
    
    it(@"track with value", ^{
//        SEGTrackPayload *payload = [[SEGTrackPayload alloc] initWithEvent:@"Starship Refueled" properties:@{@"value": @200.15, @"Fuel Type":@"Solar Cells"} context:@{} integrations:@{}];
//        
//        [integration track:payload];
//        
//        [verify(mockTaplytics) logEvent:@"Starship Refueled" value:@200.15 metaData:@{@"Fuel Type": @"Solar Cells"}];
    });
    
    it(@"reset", ^{
//        [integration reset];
//        
//        [verify(mockTaplytics) resetUser:nil];
    });
});

SpecEnd

