package org.larse.tsclass
{
	import org.larse.vos.LuLcEntry;

	/**
	 * represents a landuse/landcover call in LT attribution.
	 */
	[Bindable]
	public class LtLuLc
	{
		
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
		
		private var _dominantLandUse:String = "";
		public function get dominantLandUse():String {
			return _dominantLandUse;
		}
		public function set dominantLandUse(value:String):void {
			if (value != _dominantLandUse) {
				_dominantLandUse = value;
			}
		}
		
		private var _otherLandUse:String = "";
		public function get otherLandUse():String {
			return _otherLandUse;
		}
		public function set otherLandUse(value:String):void {
			if (value != _otherLandUse)
				_otherLandUse = value;
		}
		
		private var _landUseConfidence:String = "High";
		public function get landUseConfidence():String {
			return _landUseConfidence;
		}

		public function set landUseConfidence(value:String):void {
			if (value != _landUseConfidence)
				_landUseConfidence = value;
		}
		
		private var _dominantLandUseLT50:Boolean = false;
		public function get dominantLandUseLT50():Boolean {
			return _dominantLandUseLT50;
		}

		public function set dominantLandUseLT50(value:Boolean):void {
			if (value != _dominantLandUseLT50)
				_dominantLandUseLT50 = value;
		}
		
		private var _dominantLandCover:String = "";
		public function get dominantLandCover():String{
			return _dominantLandCover;
		}

		public function set dominantLandCover(value:String):void{
			if (value != _dominantLandCover) {
				_dominantLandCover = value;
			}
		}
		
		private var _otherLandCover:String = "";
		public function get otherLandCover():String {
			return _otherLandCover;
		}

		public function set otherLandCover(value:String):void {
			if (value != _otherLandCover) {
				_otherLandCover = value;
			}
		}
		
		private var _landCoverConfidence:String = "High";
		public function get landCoverConfidence():String {
			return _landCoverConfidence;
		}
		
		public function set landCoverConfidence(value:String):void {
			if (value != _landCoverConfidence) {
				_landCoverConfidence = value;
			}
		}
		
		private var _dominantLandCoverLT50:Boolean = false;
		public function get dominantLandCoverLT50():Boolean {
			return _dominantLandCoverLT50;
		}

		public function set dominantLandCoverLT50(value:Boolean):void {
			if (value != _dominantLandCoverLT50)
				_dominantLandCoverLT50 = value;
		}
		
		private var _category:String = "Before";
		public function get category():String {
			return _category;
		}
		public function set category(value:String):void {
			_category = value;
		}
		
		private var _endDominantLandCover:String="";
		public function get endDominantLandCover():String {
			return _endDominantLandCover;
		}

		public function set endDominantLandCover(value:String):void {
			if (value != _endDominantLandCover)
				_endDominantLandCover = value;
		}
		
		private var _endOtherLandCover:String="";
		public function get endOtherLandCover():String {
			return _endOtherLandCover;
		}
		
		public function set endOtherLandCover(value:String):void {
			if (value != _endOtherLandCover)
				_endOtherLandCover = value;
		}
		
		
		private var _isDirty:Boolean = false;
		public function get isDirty():Boolean {
			return _isDirty;
		}

		public function set isDirty(value:Boolean):void	{
			_isDirty = value;
		}
		
		public function LtLuLc(cat:String="Before") {
			_category = cat;
		}
		
		public function make(data:LuLcEntry):void {
			this.category = data.category;
			this.dominantLandCover = data.dominant_landcover;
			this.dominantLandCoverLT50 = data.dominant_landcover_lt50>0;
			this.dominantLandUse = data.dominant_landuse;
			this.dominantLandUseLT50 = data.dominant_landuse_lt50>0;
			this.groups = data.groups;
			this.interpreter = data.interpreter;
			this.isDirty = false;
			this.landCoverConfidence = data.landcover_confidence;
			this.landUseConfidence = data.landuse_confidence;
			this.otherLandCover = data.other_landcover;
			this.otherLandUse = data.other_landuse;
			this.plotid = data.plotid;
			this.project_id = data.project_id;
			this.tsa = data.tsa;
			this.endDominantLandCover = data.end_dominantLandcover;
			this.endOtherLandCover = data.end_otherLandcover;
			
		}
		
		public function get values():String {
			var retstr:String = "";
			
			//if (dominantLandUse!=null && dominantLandUse.length>0 &&
				//dominantLandCover!=null && dominantLandCover.length>0) {
			if (dominantLandCover!=null && dominantLandCover.length>0) {
				retstr += project_id + "," + tsa + "," + plotid + ",'"
				     + category + "'," + 0 + "," + 0 + ",'"
					 + dominantLandUse + "'," + (dominantLandUseLT50?1:0) + ",'"
					 + otherLandUse + "','" + landUseConfidence + "','"  
					 + dominantLandCover + "'," + (dominantLandCoverLT50?1:0) + ",'"
					 + otherLandCover + "','" + landCoverConfidence + "'," 
					 + interpreter + "," + groups + ",'" + endDominantLandCover + "','"
					 + endOtherLandCover + "'";
			}
			return retstr;
		}
	}
}
