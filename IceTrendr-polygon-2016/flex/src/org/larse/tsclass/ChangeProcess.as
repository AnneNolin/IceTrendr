package org.larse.tsclass
{
	import org.larse.vos.ProcessEntry;

	[Bindable]
	public class ChangeProcess
	{
		public function ChangeProcess(prj:int=-1,tsa:int=-1,pid:int=-1,interpreter:int=-1) {
			_project_id = prj;
			_tsa = tsa;
			_plotid = pid;
			_interpreter = interpreter;
		}
	
		private var _project_id:int=-1;
		public function get project_id():int {
			return _project_id;
		}
		public function set project_id(value:int):void {
			_project_id = value;
		}
		
		private var _tsa:int = -1;
		public function get tsa():int {
			return _tsa;
		}
		public function set tsa(value:int):void {
			_tsa = value;
		}

		private var _plotid:int = -1;
		public function get plotid():int {
			return _plotid;
		}
		public function set plotid(value:int):void {
			_plotid = value;
		}

		private var _groups:int = -1;
		public function get groups():int {
			return _groups;
		}
		public function set groups(value:int):void {
			_groups = value;
		}

		private var _interpreter:int = -1;
		public function get interpreter():int {
			return _interpreter;
		}
		public function set interpreter(value:int):void {
			_interpreter = value;
		}
		
		private var _changeProcess:String="";
		public function get changeProcess():String {
			return _changeProcess;
		}
		public function set changeProcess(value:String):void {
			_changeProcess = value;
		}

		private var _shapeConfidence:String="";
		public function get shapeConfidence():String {
			return _shapeConfidence;
		}
		public function set shapeConfidence(value:String):void
		{
			_shapeConfidence = value;
		}
		
		private var _contextConfidence:String = "";
		public function get contextConfidence():String {
			return _contextConfidence;
		}
		public function set contextConfidence(value:String):void {
			_contextConfidence = value;
		}

		private var _trajectoryConfidence:String="";
		public function get trajectoryConfidence():String {
			return _trajectoryConfidence;
		}
		public function set trajectoryConfidence(value:String):void	{
			_trajectoryConfidence = value;
		}
		
		private var _comments:String="";
		public function get comments():String {
			return _comments;
		}
		public function set comments(value:String):void	{
			_comments = value;
		}
		
		private var _isSnow:Boolean=false;
		public function get isSnow():Boolean {
			return _isSnow;
		}
		public function set isSnow(value:Boolean):void {
			_isSnow = value;
		}
		
		private var _isPhenology:Boolean=false;
		public function get isPhenology():Boolean {
			return _isPhenology;
		}
		public function set isPhenology(value:Boolean):void	{
			_isPhenology = value;
		}

		private var _isCloud:Boolean=false;
		public function get isCloud():Boolean {
			return _isCloud;
		}
		public function set isCloud(value:Boolean):void {
			_isCloud = value;
		}

		private var _isMisregistration:Boolean = false;
		public function get isMisregistration():Boolean {
			return _isMisregistration;
		}
		public function set isMisregistration(value:Boolean):void {
			_isMisregistration = value;
		}

		private var _isPartialPatch:Boolean = false;
		public function get isPartialPatch():Boolean {
			return _isPartialPatch;
		}
		public function set isPartialPatch(value:Boolean):void {
			_isPartialPatch = value;
		}

		private var _isWrongYear:Boolean = false;
		public function get isWrongYear():Boolean {
			return _isWrongYear;
		}
		public function set isWrongYear(value:Boolean):void {
			_isWrongYear = value;
		}

		//is the plot interpretation complete?
		public function get isComplete():Boolean {
			return true;	
		}
		
		public function make(data:ProcessEntry):void {
			this.changeProcess = data.process;
			this.comments = data.comments;
			this.contextConfidence = data.context;
			this.groups = data.groups;
			this.interpreter = data.interpreter;
			this.isCloud = data.iscloud > 0;
			this.isMisregistration = data.ismisregistration > 0;
			this.isPartialPatch = data.ispartialpatch > 0;
			this.isPhenology = data.isphenology > 0;
			this.isSnow = data.issnow > 0;
			this.isWrongYear = data.iswrongyear > 0;
			this.plotid = data.plotid;
			this.project_id = data.project_id;
			this.shapeConfidence = data.shape;
			this.trajectoryConfidence = data.trajectory;
			this.tsa = data.tsa;
		}
		
		public function get values():String {
			var retstr:String = "";
			if (changeProcess!=null && changeProcess.length > 0) {
				retstr += project_id + "," + tsa + "," + plotid + ","
						 + groups + ",'" + changeProcess + "','" + shapeConfidence + "','"
						 + contextConfidence + "','" + trajectoryConfidence + "','" 
						 + comments.replace("'","") + "'," + interpreter + ","
						 + (isComplete?1:0) + "," + (isSnow?1:0) + "," + (isPhenology?1:0) + ","
						 + (isCloud?1:0) + "," + (isMisregistration?1:0) + "," 
						 + (isPartialPatch?1:0) + "," + (isWrongYear?1:0);
			}
			return retstr;
		}
		
	}
}