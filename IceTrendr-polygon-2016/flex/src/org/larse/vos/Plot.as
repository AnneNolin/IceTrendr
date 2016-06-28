/**
 * This is a generated sub-class of _Plot.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 *
 * NOTE: Do not manually modify the RemoteClass mapping unless
 * your server representation of this class has changed and you've 
 * updated your ActionScriptGeneration,RemoteClass annotation on the
 * corresponding entity 
 **/ 
 
package org.larse.vos
{

import com.adobe.fiber.core.model_internal;

import mx.collections.ArrayCollection;

import org.larse.tsclass.ChangeProcess;
import org.larse.tsclass.LtLuLc;

[Bindable]
public class Plot extends _Super_Plot
{
    /** 
     * DO NOT MODIFY THIS STATIC INITIALIZER - IT IS NECESSARY
     * FOR PROPERLY SETTING UP THE REMOTE CLASS ALIAS FOR THIS CLASS
     *
     **/
     
    /**
     * Calling this static function will initialize RemoteClass aliases
     * for this value object as well as all of the value objects corresponding
     * to entities associated to this value object's entity.  
     */     
    public static function _initRemoteClassAlias() : void
    {
        _Super_Plot.model_internal::initRemoteClassAliasSingle(org.larse.vos.Plot);
        _Super_Plot.model_internal::initRemoteClassAliasAllRelated();
    }
     
    model_internal static function initRemoteClassAliasSingleChild() : void
    {
        _Super_Plot.model_internal::initRemoteClassAliasSingle(org.larse.vos.Plot);
    }
    
    {
        _Super_Plot.model_internal::initRemoteClassAliasSingle(org.larse.vos.Plot);
    }
    /** 
     * END OF DO NOT MODIFY SECTION
     *
     **/    
	
	public var plotSpectrals:ArrayCollection = new ArrayCollection();
	
	private var _isSpectralLoaded:Boolean = false;
	public function get isSpectralLoaded():Boolean {
		return _isSpectralLoaded;
	}
	public function set isSpectralLoaded(value:Boolean):void {
		_isSpectralLoaded = value;
		if (!value)
			plotSpectrals.removeAll();
	}

	// has the process information been loaded?
	private var _isProcessLoaded:Boolean = false;
	public function get isProcessLoaded():Boolean {
		return _isProcessLoaded;
	}

	public function set isProcessLoaded(value:Boolean):void {
		_isProcessLoaded = value;
	}

	//has the vertex information been loaded?
	private var _isVertexLoaded:Boolean = false;
	public function get isVertexLoaded():Boolean {
		return _isVertexLoaded;
	}

	public function set isVertexLoaded(value:Boolean):void {
		_isVertexLoaded = value;
	}
	
	
	
	//likely change process
	private var _likelyProcess:ChangeProcess;
	public function get likelyProcess():ChangeProcess {
		if (_likelyProcess == null) {
			_likelyProcess = new ChangeProcess(this.project_id, this.tsa, this.plotid);
			_likelyProcess.groups = 1;
		}
		return _likelyProcess;
	}

	public function set likelyProcess(value:ChangeProcess):void {
		_likelyProcess = value;
	}

	private var _likelyStart:LtLuLc;
	public function get likelyStart():LtLuLc {
		if (_likelyStart == null) {
			_likelyStart = new LtLuLc();
			_likelyStart.project_id = this.project_id;
			_likelyStart.tsa = this.tsa;
			_likelyStart.plotid = this.plotid;
			_likelyStart.groups = 1;
		}
		return _likelyStart;
	}
	
	public function set likelyStart(value:LtLuLc):void {
		_likelyStart = value;
	}

	private var _likelyEnd:LtLuLc;
	public function get likelyEnd():LtLuLc {
		if (_likelyEnd == null) {
			_likelyEnd = new LtLuLc("After");
			_likelyEnd.project_id = this.project_id;
			_likelyEnd.tsa = this.tsa;
			_likelyEnd.plotid = this.plotid;
			_likelyEnd.groups = 1;
		}
		return _likelyEnd;
	}

	public function set likelyEnd(value:LtLuLc):void {
		_likelyEnd = value;
	}

	//possible change process
	private var _possibleProcess:ChangeProcess;
	public function get possibleProcess():ChangeProcess {
		if (_possibleProcess == null) {
			_possibleProcess = new ChangeProcess(this.project_id, this.tsa, this.plotid);
			_possibleProcess.groups = 2;
		}
		return _possibleProcess;
	}

	public function set possibleProcess(value:ChangeProcess):void {
		_possibleProcess = value;
	}
	
	private var _possibleStart:LtLuLc;
	public function get possibleStart():LtLuLc {
		if (_possibleStart == null) {
			_possibleStart = new LtLuLc();
			_possibleStart.project_id = this.project_id;
			_possibleStart.tsa = this.tsa;
			_possibleStart.plotid = this.plotid;
			_possibleStart.groups = 2;
		}
		return _possibleStart;
	}

	public function set possibleStart(value:LtLuLc):void {
		_possibleStart = value;
	}
	
	private var _possibleEnd:LtLuLc;
	public function get possibleEnd():LtLuLc {
		if (_possibleEnd == null) {
			_possibleEnd = new LtLuLc("After");
			_possibleEnd.project_id = this.project_id;
			_possibleEnd.tsa = this.tsa;
			_possibleEnd.plotid = this.plotid;
			_possibleEnd.groups = 2;
		}
		return _possibleEnd;
	}

	public function set possibleEnd(value:LtLuLc):void {
		_possibleEnd = value;
	}
}

}