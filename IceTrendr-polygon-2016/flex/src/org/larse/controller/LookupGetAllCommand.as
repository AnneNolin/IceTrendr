package org.larse.controller
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;

	import org.larse.events.LookupEvent;
	import org.larse.model.GlobalModel;
	import org.larse.model.PlotModel;
	import org.larse.services.LandtrendrService;

	public class LookupGetAllCommand
	{
		[Inject] public var service:LandtrendrService;
		[Inject] public var global:GlobalModel;

		public function LookupGetAllCommand() {}

		public var _category:String = null;

		public function execute(event:LookupEvent):AsyncToken {
			if (global.project_id > 0 && event.category!=null) {
				_category = event.category;
				return service.getLookup(1, event.category);
			}
			else
				return null;
		}

		public function result(list:ArrayCollection):void
		{
			if (_category==null)
				return;
			else if (_category == LookupEvent.LANDCOVER)
				global.landcoverLookup = list;
			else if (_category == LookupEvent.LANDUSE)
				global.landuseLookup = list;
			else if (_category == LookupEvent.PROCESSES)
				global.changeProcesses = list;
		}

		public function error(fault:FaultEvent):void
		{
			Alert.show("Database had an error", "Get Lookup Error");
		}
	}
}