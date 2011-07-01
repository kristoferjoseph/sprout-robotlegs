package <%= package_name %> 
{	
	import flash.display.Sprite;
	
	import <%= context_package %>;
	import <%= view_package %>.<%= class_name %>;
	
	import org.robotlegs.base.ContextEvent;
	
	public class <%= class_name %> extends Sprite 
	{		
		public function <%= class_name %>() 
		{			
			init();
		}		
		
		protected function init():void
		{
			var <%= class_name.snake_case %>View:<%= class_name %>View = new <%= class_name %>View();
			addChild(<%= class_name.snake_case %>View);
			var <%= class_name.snake_case %>:<%= class_name %> = new <%= class_name %>(<%= class_name.snake_case %>View, false);
			
			<%= class_name.snake_case %>.startup();
		}
	}
}
