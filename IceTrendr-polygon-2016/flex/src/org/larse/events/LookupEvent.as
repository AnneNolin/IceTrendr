package org.larse.events
{
	import flash.events.Event;
	
	import org.larse.vos.Plot;
	
	public class LookupEvent extends Event
	{
		public static const LANDUSE:String = "landuse";
		public static const LANDCOVER:String = "landcover";
		public static const PROCESSES:String = "process";
		
		public static const LOOKUP_GET_ALL:String = "get_lookup";
		
		public function LookupEvent(type:String, cate:String=null, bubbles:Boolean=true, cancelable:Boolean=true) {
			super(type, bubbles, cancelable);
			_category = cate;
		}
		
		private var _category:String = null;
		public function get category():String {
			return _category;
		}

		public function set category(value:String):void {
			_category = value;
		}
	}
}