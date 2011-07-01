package <%= mediator_package %>
{	
	import <%= view_package %>.<%= view_class_name %>;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class <%= view_class_name %>Mediator extends ModuleMediator
	{		
		// Declare the view to be injected
		[Inject]
		public var view:<%= view_class_name %>;
		
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
