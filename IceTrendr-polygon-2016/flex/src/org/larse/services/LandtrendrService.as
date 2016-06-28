/**
 * This is a generated sub-class of _LandtrendrService.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 **/
 
package org.larse.services {
	import mx.rpc.AsyncToken;

	public class LandtrendrService extends _Super_LandtrendrService {
	    /**
	     * Override super.init() to provide any initialization customization if needed.
	     */
	    protected override function preInitializeService():void {
	
	        super.preInitializeService();
	        // Initialization customization goes here
	    }

		//---------------------------------------------------------
		//  Service Properties
		//---------------------------------------------------------
		//public var gateway:String = "";
		public var server:String = "";
		
		
		//---------------------------------------------------------
		//  LookupService
		//---------------------------------------------------------
		private var _lookupService:LookupService;
		private function get lookupService():LookupService {
			if (_lookupService==null) {
				_lookupService = new LookupService();
				_lookupService.endpoint = this.endpoint;
			}
			return _lookupService;
		}
		
		public function getLookup(pid:int, category:String):AsyncToken {
			return lookupService.getLookup(pid, category);
		}

		
		//---------------------------------------------------------
		//  PlotService
		//---------------------------------------------------------
		private var _plotService:PlotsService;
		private function get plotService():PlotsService {
			if (_plotService==null) {
				_plotService = new PlotsService();
				_plotService.endpoint = this.endpoint;
			}
			return _plotService;
		}
		
		public function getAllPlots(pid:int, tsa:int):AsyncToken {
			return plotService.getAllPlots(pid, tsa);
		}

		//---------------------------------------------------------
		//  ImageListService
		//---------------------------------------------------------
		private var _imageService:ImageListService;
		private function get imageService():ImageListService {
			if (_imageService==null) {
				_imageService = new ImageListService();
				_imageService.endpoint = this.endpoint;
			}
			return _imageService;
		}
		
		public function getImageList(pid:int, tsa:int):AsyncToken {
			return imageService.getImageList(pid, tsa);
		}
		
		//---------------------------------------------------------
		//  RegionSpectralService
		//---------------------------------------------------------
		private var _regionSpectralService:RegionSpectralService = null; 
		protected function get regionSpectralService():RegionSpectralService {
			if (_regionSpectralService==null) {
				_regionSpectralService = new RegionSpectralService();
				_regionSpectralService.endpoint = this.endpoint;
			}
			return _regionSpectralService;
		}
		
		public function getPlotRegionSpectral(project_id:int, tsa:int, plotid:int):AsyncToken {
			return regionSpectralService.getRegionSpectralByPlot(project_id, tsa, plotid);
		}	
		
		
		//---------------------------------------------------------
		//  ProcessService
		//---------------------------------------------------------
		private var _processService:ChangeProcessService = null; 
		protected function get processService():ChangeProcessService {
			if (_processService==null) {
				_processService = new ChangeProcessService();
				_processService.endpoint = this.endpoint;
			}
			return _processService;
		}
		
		public function getProcessForPlot(prjid:int, tsa:int, plotid:int, interpreter:int):AsyncToken {
			return processService.getProcessForPlot(prjid, tsa, plotid, interpreter);
		}
		
		public function updatePlotProcess(prjid:int, tsa:int, plotid:int, interpreter:int, sqlstr:String):AsyncToken {
			trace("updating process: " + sqlstr);
			return processService.updatePlotProcess(prjid, tsa, plotid, interpreter, sqlstr);
		}
		
		//---------------------------------------------------------
		//  VertexService
		//---------------------------------------------------------
		private var _vertexService:VertexService = null; 
		protected function get vertexService():VertexService {
			if (_vertexService==null) {
				_vertexService = new VertexService();
				_vertexService.endpoint = this.endpoint;
			}
			return _vertexService;
		}
		
		public function getVertexForPlot(prjid:int, tsa:int, plotid:int, interpreter:int):AsyncToken {
			return vertexService.getVertexForPlot(prjid, tsa, plotid, interpreter);
		}
		
		public function updatePlotVertex(prjid:int, tsa:int, plotid:int, interpreter:int, sqlstr:String):AsyncToken {
			trace("updating vertex: " + sqlstr);
			return vertexService.updatePlotVertex(prjid, tsa, plotid, interpreter, sqlstr);
		}
		
		//---------------------------------------------------------
		//  UserService
		//---------------------------------------------------------
		private var _userService:UserService = null;
		public function get userService():UserService {
			if (_userService == null) {
				_userService = new UserService();
				_userService.endpoint = this.endpoint;
			}
			return _userService;
		}
		
		public function login(user_name:String, pass:String):AsyncToken {
			return userService.getUserByCredential(user_name, pass);
		}

		//---------------------------------------------------------
		//  ProjectService
		//---------------------------------------------------------
		private var _projectService:ProjectService = null;
		protected function get projectService():ProjectService {
			if (_projectService==null) {
				_projectService = new ProjectService();
				_projectService.endpoint = this.endpoint;
			}
			return _projectService;
		}
		
		public function getAssignments(user_id:int):AsyncToken {
			return projectService.getUserTasks(user_id);
		}	
		
	}
}
