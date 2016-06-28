package org.larse.tsclass
{
	public class PlotSpectral
	{
		public static var TM:String = "tm";
		public static var MSS:String = "mss";
		public static var MODIS:String = "modis";
		
		public var plotid:int;
		public var year:int;
		public var julday:int;
		public var sensor:String;
		public var b1:Number;
		public var b2:Number;
		public var b3:Number;
		public var b4:Number;
		public var b5:Number;
		public var b7:Number;
		public var brightness:Number;
		public var greenness:Number;
		public var wetness:Number;
		
		public var sequence:int;
		
		public function get ndvi():Number {
			if (sensor==PlotSpectral.MSS)
				return b2+b4==0?-99:int((b4-b2)/(b4+b2)*100)/100;
			else
				return b3+b4==0?-99:int((b4-b3)/(b4+b3)*100)/100;
		}
		
		public function get b3b5():Number {
			return (b3/b5);
		}

		public function get doy():Number {
			return (julday);
		}

		public function get turb():Number {
			return (-0.441 + 0.0340*b3 + 0.0507*b4);
		}

		public function get nbr():Number {
			if (sensor == PlotSpectral.MSS)
				return 0;
			if ((b4+b7)==0)
				return -99;
			return int((b4-b7)/(b4+b7)*100)/100;
		}
		
		public function get ndsi():Number {
			if (sensor == PlotSpectral.MSS)
				return 0;
			if ((b2+b5)==0)
				return -99;
			return int((b2-b5)/(b2+b5)*100)/100;
		}
		
		public function get angle():Number {
			if (brightness == 0)
				return -99;
			else
				return int(Math.atan2(greenness, brightness)*180.0/Math.PI*100)/100;
		}
		
		public function get distance():Number {
			return int(Math.sqrt(brightness*brightness + greenness*greenness)*100)/100;
		}
		
		public function get imageDateAsNumber():Number {
			return int((year + julday / 366)*100)/100;	
		}
		
		public function get imageLabel():String {
			return "" + year + "-" + julday;
		}
		
		public function PlotSpectral(plotid:int, year:int, julday:int,
									 b1:Number=0, b2:Number=0, b3:Number=0,
									 b4:Number=0, b5:Number=0, b7:Number=0,
									 b:Number=0, g:Number=0, w:Number=0, 
									 sensor:String="tm")
		{
			this.sensor = sensor;
			this.plotid = plotid;
			this.year = year;
			this.julday = julday;
			this.b1 = b1;
			this.b2 = b2;
			this.b3 = b3;
			this.b4 = b4;
			this.b5 = b5;
			this.b7 = b7;
			this.brightness = b;
			this.greenness = g;
			this.wetness = w;
		}
	}
}
