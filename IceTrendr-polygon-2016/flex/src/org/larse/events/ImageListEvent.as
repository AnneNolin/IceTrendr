package org.larse.events
{
	import flash.events.Event;
	
	public class ImageListEvent extends Event
	{
		public static const IMAGE_LIST_GET:String = "get_image_list";
		public static const IMAGE_LIST_CHANGED:String = "image_list_changed";
		
		public function ImageListEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(type, bubbles, cancelable);
		}
	}
}