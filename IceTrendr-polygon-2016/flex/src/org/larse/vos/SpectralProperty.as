package org.larse.vos
{
	[Bindable]
	public class SpectralProperty
	{
		public var spectral_name:String="";
		public var spectral_std:Number = 0;
		public var spectral_mean:Number = 0;
		public var spectral_max:Number = 0;
		public var spectral_min:Number = 0;
		
		public function SpectralProperty(name:String="", min:Number=0, mean:Number=0, max:Number=0, std:Number=0)
		{
			spectral_name = name;
			spectral_std = std;
			spectral_mean = mean;
			spectral_max = max;
			spectral_min = min;
		}
		
		public function get range():Number {
			return this.spectral_max - this.spectral_min;
		}
	}
}
