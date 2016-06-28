package org.larse.controller
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;

	import org.larse.events.ImageListEvent;
	import org.larse.model.GlobalModel;
	import org.larse.model.ImageListModel;
	import org.larse.services.LandtrendrService;

	public class ImageListGetCommand
	{
		[Inject] public var im_service:LandtrendrService;
		[Inject] public var imageList_model:ImageListModel;
		[Inject] public var global:GlobalModel;

		public function ImageListGetCommand() {}

		public function execute(event:ImageListEvent):AsyncToken
		{
			if (global.project_id > 0 && global.tsa > 0) {
				return im_service.getImageList(global.project_id, global.tsa);
			}
			else
				return null;
		}

		public function result(list:ArrayCollection):void
		{
			imageList_model.imageList = list;
		}

		public function error(fault:FaultEvent):void
		{
			Alert.show("Database had an error", "Get Plots Error");
		}
	}
}