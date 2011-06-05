package <%= package_name %>
{	
	import <%= component_package_name %>.<%= class_name %>;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class <%= class_name %>Mediator extends Mediator
	{		
		// Declare the view to be injected
		[Inject]
		public var view:<%= class_name %>;
		
		//---------------------------------------
		// OVERRIDEN METHODS
		//---------------------------------------
		
		override public function onRegister():void
		{
			// Register your events in the eventMap here
			// eventMap.mapListener(YOUR VIEW COMPONENT, YOUR EVENT, YOUR HANDLER);
			
			// Optionally add bindings to your view components public variables
			
			super.onRegister();
		}
		
		override public function onRemove():void
		{
			// Remove any listeners or bindings here
			// eventMap.unmapListeners();
			super.onRemove();
		}
	}
}
