package org.larse.controller
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;

	import org.larse.events.ProjectEvent;
	import org.larse.model.GlobalModel;
	import org.larse.services.LandtrendrService;
	import org.larse.vos.Plot;

	public class AssignmentGetCommand
	{
		[Inject] public var service:LandtrendrService;
		[Inject] public var global:GlobalModel;

		public function AssignmentGetCommand() {}

		public function execute(event:ProjectEvent):AsyncToken
		{
			if (global.user_id > 0 || global.user_id == -9999) {
				return service.getAssignments(global.user_id);
			}
			else
				return null;
		}

		public function result(list:ArrayCollection):void
		{
			global.assignments = list;
		}

		public function error(fault:FaultEvent):void
		{
			Alert.show("Database had an error", "Get Assignments Error");
		}
	}
}