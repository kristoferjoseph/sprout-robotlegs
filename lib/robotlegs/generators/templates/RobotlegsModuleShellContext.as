package <%= context_package_name %>
{
	import flash.display.DisplayObjectContainer;

    import org.robotlegs.core.IInjector;
    import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class <%= class_name %>Context extends ModuleContext 
	{		
		public function <%= class_name %>Context(contextView:DisplayObjectContainer, injector:IInjector)
        {
            super(contextView, true, injector);
        }
		
		override public function startup():void
		{			
			//
		}
	}
}