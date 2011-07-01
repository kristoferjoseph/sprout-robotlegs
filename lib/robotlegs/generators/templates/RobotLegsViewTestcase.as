package <%= package_name %> 
{    
    import asunit.asserts.*;
    import asunit.framework.IAsync;
    import flash.display.Sprite;

	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	
	import <%= component_package_name %>.<%= component_class_name %>;

    public class <%= test_class_name %> 
	{
        [Inject]
        public var async:IAsync;

        [Inject]
        public var context:Sprite;

        private var <%= instance_name %>:<%= class_name %>;

        [Before]
        public function setUp():void 
		{
            <%= instance_name %> = new <%= class_name %>();
        }

        [After]
        public function tearDown():void 
		{
            <%= instance_name %> = null;
        }

        [Test]
        public function shouldBeInstantiated():void 
		{
            assertTrue("<%= instance_name %> is <%= class_name %>", <%= instance_name %> is <%= class_name %>);
        }
		
		[Test]
		public function isMediator():void
		{
			assertTrue("<%= instance_name %> is <%= class_name %>", <%= instance_name %> is <%= class_name %>);
		}
		
		[Test]
		public function failure():void
		{
			assertTrue("Failing test", false);
		}
    }
}