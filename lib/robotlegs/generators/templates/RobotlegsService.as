package <%= package_name %>
{	
	import org.robotlegs.mvcs.Actor;
	
	public class <%= class_name %> extends Actor
	{
		//---------------------------------------
		// CONSTRUCTOR
		//---------------------------------------
		
		public function <%= class_name %>()
		{
			super();
			initialize();
		}
		
		//---------------------------------------
		// PROTECTED METHODS
		//---------------------------------------
		
		protected function initialize():void
		{
			//Add any initialization here
			//example: myArrayCollection = new ArrayCollection();
			//Your content to assert here
		}
	}
}
