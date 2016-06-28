package org.larse.model
{
	import flash.events.EventDispatcher;
	import mx.collections.ArrayCollection;
	import org.larse.events.ImageListEvent;

	public class ImageListModel extends EventDispatcher
	{
		private var _imageList:ArrayCollection;

		[Bindable]
		public function get imageList():ArrayCollection
		{
			return _imageList;
		}

		public function set imageList(value:ArrayCollection):void
		{
			_imageList = value;
			is_loaded = true;
		}

		public var is_loaded:Boolean = false;
	}
}