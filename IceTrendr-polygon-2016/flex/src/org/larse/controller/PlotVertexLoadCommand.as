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
	import org.larse.tsclass.LtLuLc;
	import org.larse.vos.LuLcEntry;
	import org.larse.vos.Plot;

	public class PlotVertexLoadCommand
	{
		[Inject] public var service:LandtrendrService;
		[Inject] public var plotModel:PlotModel;
		[Inject] public var global:GlobalModel;

		private var _plot:Plot = null;

		public function PlotVertexLoadCommand() {}

		public function execute(event:PlotEvent):AsyncToken
		{
			_plot = event.CurrentPlot;

			if (global.project_id > 0 && global.tsa > 0) {
				return service.getVertexForPlot(global.project_id, global.tsa, _plot.plotid, global.interpreter.user_id);
			}
			else
				return null;
		}

		public function result(list:ArrayCollection):void
		{
			for each (var ve:LuLcEntry in list) {
				var le:LtLuLc = new LtLuLc();
				le.make(ve);

				switch(le.groups) {
					case 1: {//likely group
						if (le.category == "Before"){
							_plot.likelyStart = le;
						}
						else {
							_plot.likelyEnd = le;
						}
						break;
					}
					case 2: {
						if (le.category == "Before")
							_plot.possibleStart = le;
						else
							_plot.possibleEnd = le;
						break;
					}
					default: {
						break;
					}
				}
			}

			_plot.isVertexLoaded = true;
			plotModel.plotModified(PlotEvent.PLOT_VERTEX_MODIFIED);
		}

		public function error(fault:FaultEvent):void
		{
			Alert.show("Database had an error", "Load Plot Vertex Error");
		}
	}
}