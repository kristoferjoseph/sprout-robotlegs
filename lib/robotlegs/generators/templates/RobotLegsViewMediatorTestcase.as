package <%= package_name %> 
{    
    import asunit.asserts.*;
    import asunit.framework.IAsync;
    import flash.display.Sprite;

	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;

    public class <%= test_class_name %>Mediator 
	{
        [Inject]
        public var async:IAsync;

        [Inject]
        public var context:Sprite;

        private var <%= instance_name %>:<%= class_name %>Mediator;

        [Before]
        public function setUp():void 
		{
            <%= instance_name %>Mediator = new <%= class_name %>Mediator();
			<%= instance_name %>Mediator.view = new <%= class_name %>();
			<%= instance_name %>Mediator.eventDispatcher = new EventDispatcher();
			<%= instance_name %>Mediator.onRegister();
        }

        [After]
        public function tearDown():void 
		{
            <%= instance_name %>Mediator = null;
        }

        [Test]
        public function shouldBeInstantiated():void 
		{
            assertTrue("<%= instance_name %>Mediator is <%= class_name %>Mediator", <%= instance_name %> is <%= class_name %>Mediator);
        }
		
		[Test]
		public function isMediator():void
		{
			assertTrue("<%= instance_name %>Mediator is robotlegs Mediator", <%= instance_name %>Mediator is Mediator);
		}
		
		[Test]
		public function failure():void
		{
			assertTrue("Failing test", false);
		}
    }
}