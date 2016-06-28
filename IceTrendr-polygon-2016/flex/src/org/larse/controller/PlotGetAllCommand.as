package org.larse.controller
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;

	import org.larse.events.PlotEvent;
	import org.larse.model.GlobalModel;
	import org.larse.model.PlotModel;
	import org.larse.services.LandtrendrService;
	import org.larse.vos.Plot;

	public class PlotGetAllCommand
	{
		[Inject] public var service:LandtrendrService;
		[Inject] public var plotModel:PlotModel;
		[Inject] public var global:GlobalModel;

		public function PlotGetAllCommand() {}

		public function execute(event:PlotEvent):AsyncToken
		{
			if (global.project_id > 0 && global.tsa > 0) {
				return service.getAllPlots(global.project_id, global.tsa); //, global.interpreter.user_id);
			}
			else
				return null;
		}

		public function result(list:ArrayCollection):void
		{
			plotModel.Plots = list;
		}

		public function error(fault:FaultEvent):void
		{
			Alert.show("Database had an error", "Get Plots Error");
		}
	}
}