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
	import org.larse.tsclass.ChangeProcess;
	import org.larse.vos.LuLcEntry;
	import org.larse.vos.Plot;
	import org.larse.vos.ProcessEntry;

	public class PlotProcessLoadCommand	{
		[Inject] public var service:LandtrendrService;
		[Inject] public var plotModel:PlotModel;
		[Inject] public var global:GlobalModel;

		private var _plot:Plot = null;

		public function PlotProcessLoadCommand() {}

		public function execute(event:PlotEvent):AsyncToken	{
			_plot = event.CurrentPlot;

			if (global.project_id > 0 && global.tsa > 0) {
				return service.getProcessForPlot(global.project_id, global.tsa, _plot.plotid, global.interpreter.user_id);
			}
			else
				return null;
		}

		public function result(list:ArrayCollection):void {
			for each (var pe:ProcessEntry in list) {
				var p:ChangeProcess = new ChangeProcess();
				p.make(pe);

				if (p.groups == 1) //likely group
					_plot.likelyProcess = p;
				else
					_plot.possibleProcess = p;
			}

			_plot.isProcessLoaded = true;
			plotModel.plotModified(PlotEvent.PLOT_PROCESS_MODIFIED);
		}

		public function error(fault:FaultEvent):void {
			Alert.show("Database had an error", "Load Plot Vertex Error");
		}
	}
}