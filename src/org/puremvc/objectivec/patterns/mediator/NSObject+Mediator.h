//
//  NSObject+Mediator.h
//  PureMVC_ObjectiveC
//
//  PureMVC Port to ObjectiveC by Brian Knorr <brian.knorr@puremvc.org>
//  PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
//

#import "IMediator.h"
#import "INotifier.h"

@class Facade;
@protocol IFacade;

/**
 * A base <code>IMediator</code> implementation.
 * 
 * <P>
 * This category replaces the former <code>Mediator</code> class
 * and extends ViewControllers with the following methods from the 
 * IMediator protocol:
 * <UL>
 * <LI><code>listNotificationInterests</code> to register a ViewController for <code>Notification</code> events</LI>
 * <LI><code>handleNotification</code> handle a <code>Notification</code> event, a ViewController has been registered for</LI>
 * <LI><code>register</code> register a ViewController with the <code>View</code> in order to receive <code>Notification</code> events</LI>
 * <LI><code>unregister</code> unregister a ViewController from the <code>View</code></LI>
 * <LI><code>facade</code> retrieve a reference to the <code>Facade</code> singleton instance</LI>
 * </UL></P>
 *
 * <p>
 * You usually implement this category in any ViewController or AppDelegate
 * that must communicate with the pureMVC framework.</P>
 *
 * @see View
 */
@interface NSObject (Mediator) <IMediator,INotifier>

-(void)register;
-(void)unregister;
-(id<IFacade>)facade;
@end
