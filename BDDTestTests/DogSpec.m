#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"

#import "Dog.h"


SpecBegin(Dog)

__block Dog *dog;

beforeEach(^{
    dog = [Dog new];
});

context(@"barks", ^{
    it(@"can bark", ^{
        expect(dog.bark).to.equal(@"bark!");
    });
});

SpecEnd
