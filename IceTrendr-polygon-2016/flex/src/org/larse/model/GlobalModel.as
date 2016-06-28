package org.larse.model
{
	import flash.events.EventDispatcher;

	import mx.collections.ArrayCollection;

	import org.larse.events.LandtrendrEvent;
	import org.larse.events.ProjectEvent;
	import org.larse.vos.Interpreter;

	[Bindable]
	[Event(name="assignment_changed",type="org.larse.events.ProjectEvent")]
	[Event(name="login_successful",type="org.larse.events.TimeSyncEvent")]
	[ManagedEvents("login_successful,assignment_changed")]
	public class GlobalModel extends EventDispatcher
	{
		public var scale:Number = 1.0;
		public var view_size:int = 125;
		public var plot_size:int = 3;

		public var min_year:int = 9999;
		public var max_year:int = 0;

		public var user_id:int = 0;
		public var project_id:int = -1;
		public var tsa:int = -1;

		public function GlobalModel()
		{
			scale = 1.0;
		}

		//assignment for current user
		private var _assignments:ArrayCollection = null;
		public function get assignments():ArrayCollection {
			return _assignments;
		}
		public function set assignments(value:ArrayCollection):void {
			_assignments = value;
			this.dispatchEvent(new ProjectEvent(ProjectEvent.ASSIGNMENT_CHANGED, true, true));
		}

		//Look up table for change process
		private var _changeProcessesLookup:ArrayCollection = new ArrayCollection();
		public function get changeProcesses():ArrayCollection {
			return _changeProcessesLookup;
		}
		public function set changeProcesses(value:ArrayCollection):void {
			_changeProcessesLookup = value;
		}

		//look up table for land use
		private var _landuseLookup:ArrayCollection = new ArrayCollection();
		public function get landuseLookup():ArrayCollection {
			return _landuseLookup;
		}
		public function set landuseLookup(value:ArrayCollection):void {
			_landuseLookup = value;
		}

		//look up table for land cover
		private var _landcoverLookup:ArrayCollection = new ArrayCollection();
		public function get landcoverLookup():ArrayCollection {
			return _landcoverLookup;
		}
		public function set landcoverLookup(value:ArrayCollection):void {
			_landcoverLookup = value;
		}

		//interpreter
		private var _interpreter:Interpreter = null;
		public function get interpreter():Interpreter {
			return _interpreter;
		}

		public function set interpreter(value:Interpreter):void {
			_interpreter = value;
			user_id = _interpreter.user_id;
			this.dispatchEvent(new LandtrendrEvent(LandtrendrEvent.LOGIN_SUCCESSFUL));
		}
	}
}
