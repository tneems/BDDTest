#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "ViewController.h"

SpecBegin(ViewController)
__block ViewController *vc;
beforeEach(^{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    vc = [mainStoryboard instantiateInitialViewController];

    expect(vc.view).toNot.beNil();
});

context(@"the button", ^{
    it(@"sets up a button", ^{
        expect(vc.coolButton).to.beInstanceOf([UIButton class]);
    });

    it(@"wires up an action", ^{
        NSArray *actions = [vc.coolButton actionsForTarget:vc forControlEvent:UIControlEventTouchUpInside];
        expect(actions.firstObject).to.equal(@"buttonTapped:");
    });

    context(@"tapping the button", ^{
        beforeEach(^{
            expect(vc.meaningOfLife.text).to.beEmpty();
            [vc.coolButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        });

        it(@"sets the meaning of life when tapped", ^{
            expect(vc.meaningOfLife.text).to.equal(@"42");
        });
    });
});

context(@"meaning of life", ^{
    it(@"fades away after being finding it", ^AsyncBlock{
        vc.meaningOfLife.text = @"42";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC),
                       dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            expect(vc.meaningOfLife.text).to.beEmpty();
            done();
        });
    });
});

SpecEnd
