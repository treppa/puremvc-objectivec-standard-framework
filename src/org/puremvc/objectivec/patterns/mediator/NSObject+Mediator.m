//
//  NSObject+Mediator.m
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "NSObject+Mediator.h"
#import "Facade.h"
#import "IFacade.h"


@implementation NSObject (Mediator)



/**
 * register the <code>NSObject+Mediator</code> with the facade
 * 
 * <P>
 * Typically, register your <code>UIViewController</code>
 * or <code>NSViewController</code> subclass within the 
 * viewDidLoad method</P>
 */
-(void)register {
    [[Facade getInstance] registerMediator:self];
}

/**
 * unregister the <code>NSObject+Mediator</code> with the facade
 *
 * <P>
 * Typically, register your <code>UIViewController</code>
 * or <code>NSViewController</code> subclass within the
 * didReceiveMemoryWarning method</P>
 */
-(void)unregister {
    [[Facade getInstance] removeMediator:[self mediatorName]];
}

/**
 * retrieve the <code>Facade</code> instance from 
 * within your <code>UIViewController</code>
 * or <code>NSViewController</code> subclass
 */
-(id<IFacade>)facade {
    return [Facade getInstance];
}

/**
* The name of the <code>Mediator</code>.
*
* <P>
* Typically, a <code>Mediator</code> will be written to serve
* one specific control or group controls and so,
* will not have a need to be dynamically named.</P>
*/
+ (NSString *)NAME {
    return NSStringFromClass([self class]);
}

/**
* return the name of the mediator instance
*/
-(NSString *)mediatorName {
   return [[self class] NAME];
}

/**
 * Handle <code>INotification</code>s.
 *
 * <P>
 * Typically this will be handled in a switch statement,
 * with one 'case' entry per <code>INotification</code>
 * the <code>IMediator</code> is interested in.</P>
 */
- (void)handleNotification:(id <INotification>)notification {
}

/**
 * List the <code>INotification</code> names this
 * <code>Mediator</code> is interested in being notified of.
 *
 * @return Array the list of <code>INotification</code> names
 */
- (NSArray *)listNotificationInterests {
    return [NSArray array];
}

/**
 * Called by the View when the Mediator is registered
 */
- (void)onRegister {
}

/**
 * Called by the View when the Mediator is removed
 */
- (void)onRemove {
}


/**
 * Create and send an <code>INotification</code>.
 *
 * <P>
 * Keeps us from having to construct new INotification
 * instances in our implementation code.
 * @param notificationName the name of the notification
 * @param body the body of the notification
 * @param type the type of the notification</P>
 */
- (void)sendNotification:(NSString *)notificationName body:(id)body type:(NSString *)type {
    [[Facade getInstance] sendNotification:notificationName body:body type:type];
}

- (void)sendNotification:(NSString *)notificationName {
    [self sendNotification:notificationName body:nil type:nil];
}

- (void)sendNotification:(NSString *)notificationName body:(id)body {
    [self sendNotification:notificationName body:body type:nil];
}

- (void)sendNotification:(NSString *)notificationName type:(NSString *)type {
    [self sendNotification:notificationName body:nil type:type];
}

@end
