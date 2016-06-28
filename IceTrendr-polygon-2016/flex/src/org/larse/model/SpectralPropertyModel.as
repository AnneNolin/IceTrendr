package org.larse.model
{
	import mx.collections.ArrayCollection;
	
	import org.larse.vos.SpectralProperty;
	
	public class SpectralPropertyModel
	{
		private var _spectralProperties:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public function get spectralProperties():ArrayCollection
		{
			return _spectralProperties;
		}
		
		public function set spectralProperties(value:ArrayCollection):void
		{
			_spectralProperties = value;
		}
		
		public function SpectralPropertyModel() {
			_spectralProperties.addItem(new SpectralProperty("brightness", 0, 0.3098, 0.76, 0.1247));
			_spectralProperties.addItem(new SpectralProperty("greenness", -0.045, 0.1549, 0.395, 0.0799));
			_spectralProperties.addItem(new SpectralProperty("wetness", -0.35, -0.0701, 0.025, 0.0772));
			_spectralProperties.addItem(new SpectralProperty("ndvi", 0, 0.5, 1, 0.2));
			_spectralProperties.addItem(new SpectralProperty("b3b5", -10, 20, 50, 0.2));
			_spectralProperties.addItem(new SpectralProperty("ndsi", -1, 0.5, 1, 0.2));
			_spectralProperties.addItem(new SpectralProperty("b1", 0, 0.5, 1, 0.2));
			_spectralProperties.addItem(new SpectralProperty("b2", 0, 0.2, 0.4, 0.26));
			_spectralProperties.addItem(new SpectralProperty("b3", 0, 0.5, 1, 0.2));
			_spectralProperties.addItem(new SpectralProperty("b4", 0, 0.23, 0.4, 0.2));
			_spectralProperties.addItem(new SpectralProperty("b5", 0, 0.15, 0.4, 0.11));
			_spectralProperties.addItem(new SpectralProperty("b7", 0, 0.5, 1, 0.2));
			_spectralProperties.addItem(new SpectralProperty("doy", 1, 183, 365, 1));
			_spectralProperties.addItem(new SpectralProperty("turb", -1, 0, 1, 0.2));
		}
		
		/**
		 * get spectral property for specified spectral index
		 */
		public function getSpectralProperty(spectralname:String):SpectralProperty {
			for each (var sp:SpectralProperty in _spectralProperties) {
				if (sp.spectral_name == spectralname)
					return sp;
			}
			return null;
		}
		
	}
}
