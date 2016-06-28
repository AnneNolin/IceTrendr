/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - LuLcEntry.as.
 */

package org.larse.vos
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_LuLcEntry extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _LuLcEntryEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_end_landcover : String;
    private var _internal_tsa : int;
    private var _internal_dominant_landcover : String;
    private var _internal_image_julday : int;
    private var _internal_plotid : int;
    private var _internal_dominant_landuse : String;
    private var _internal_other_landcover : String;
    private var _internal_category : String;
    private var _internal_interpreter : int;
    private var _internal_image_year : int;
    private var _internal_end_otherLandcover : String;
    private var _internal_project_id : int;
    private var _internal_end_dominantLandcover : String;
    private var _internal_other_landuse : String;
    private var _internal_landuse_confidence : String;
    private var _internal_dominant_landcover_lt50 : int;
    private var _internal_dominant_landuse_lt50 : int;
    private var _internal_groups : int;
    private var _internal_landcover_confidence : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_LuLcEntry()
    {
        _model = new _LuLcEntryEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "end_landcover", model_internal::setterListenerEnd_landcover));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "dominant_landcover", model_internal::setterListenerDominant_landcover));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "dominant_landuse", model_internal::setterListenerDominant_landuse));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "other_landcover", model_internal::setterListenerOther_landcover));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "category", model_internal::setterListenerCategory));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "end_otherLandcover", model_internal::setterListenerEnd_otherLandcover));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "end_dominantLandcover", model_internal::setterListenerEnd_dominantLandcover));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "other_landuse", model_internal::setterListenerOther_landuse));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "landuse_confidence", model_internal::setterListenerLanduse_confidence));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "landcover_confidence", model_internal::setterListenerLandcover_confidence));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get end_landcover() : String
    {
        return _internal_end_landcover;
    }

    [Bindable(event="propertyChange")]
    public function get tsa() : int
    {
        return _internal_tsa;
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landcover() : String
    {
        return _internal_dominant_landcover;
    }

    [Bindable(event="propertyChange")]
    public function get image_julday() : int
    {
        return _internal_image_julday;
    }

    [Bindable(event="propertyChange")]
    public function get plotid() : int
    {
        return _internal_plotid;
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landuse() : String
    {
        return _internal_dominant_landuse;
    }

    [Bindable(event="propertyChange")]
    public function get other_landcover() : String
    {
        return _internal_other_landcover;
    }

    [Bindable(event="propertyChange")]
    public function get category() : String
    {
        return _internal_category;
    }

    [Bindable(event="propertyChange")]
    public function get interpreter() : int
    {
        return _internal_interpreter;
    }

    [Bindable(event="propertyChange")]
    public function get image_year() : int
    {
        return _internal_image_year;
    }

    [Bindable(event="propertyChange")]
    public function get end_otherLandcover() : String
    {
        return _internal_end_otherLandcover;
    }

    [Bindable(event="propertyChange")]
    public function get project_id() : int
    {
        return _internal_project_id;
    }

    [Bindable(event="propertyChange")]
    public function get end_dominantLandcover() : String
    {
        return _internal_end_dominantLandcover;
    }

    [Bindable(event="propertyChange")]
    public function get other_landuse() : String
    {
        return _internal_other_landuse;
    }

    [Bindable(event="propertyChange")]
    public function get landuse_confidence() : String
    {
        return _internal_landuse_confidence;
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landcover_lt50() : int
    {
        return _internal_dominant_landcover_lt50;
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landuse_lt50() : int
    {
        return _internal_dominant_landuse_lt50;
    }

    [Bindable(event="propertyChange")]
    public function get groups() : int
    {
        return _internal_groups;
    }

    [Bindable(event="propertyChange")]
    public function get landcover_confidence() : String
    {
        return _internal_landcover_confidence;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set end_landcover(value:String) : void
    {
        var oldValue:String = _internal_end_landcover;
        if (oldValue !== value)
        {
            _internal_end_landcover = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_landcover", oldValue, _internal_end_landcover));
        }
    }

    public function set tsa(value:int) : void
    {
        var oldValue:int = _internal_tsa;
        if (oldValue !== value)
        {
            _internal_tsa = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tsa", oldValue, _internal_tsa));
        }
    }

    public function set dominant_landcover(value:String) : void
    {
        var oldValue:String = _internal_dominant_landcover;
        if (oldValue !== value)
        {
            _internal_dominant_landcover = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landcover", oldValue, _internal_dominant_landcover));
        }
    }

    public function set image_julday(value:int) : void
    {
        var oldValue:int = _internal_image_julday;
        if (oldValue !== value)
        {
            _internal_image_julday = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "image_julday", oldValue, _internal_image_julday));
        }
    }

    public function set plotid(value:int) : void
    {
        var oldValue:int = _internal_plotid;
        if (oldValue !== value)
        {
            _internal_plotid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "plotid", oldValue, _internal_plotid));
        }
    }

    public function set dominant_landuse(value:String) : void
    {
        var oldValue:String = _internal_dominant_landuse;
        if (oldValue !== value)
        {
            _internal_dominant_landuse = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landuse", oldValue, _internal_dominant_landuse));
        }
    }

    public function set other_landcover(value:String) : void
    {
        var oldValue:String = _internal_other_landcover;
        if (oldValue !== value)
        {
            _internal_other_landcover = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landcover", oldValue, _internal_other_landcover));
        }
    }

    public function set category(value:String) : void
    {
        var oldValue:String = _internal_category;
        if (oldValue !== value)
        {
            _internal_category = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "category", oldValue, _internal_category));
        }
    }

    public function set interpreter(value:int) : void
    {
        var oldValue:int = _internal_interpreter;
        if (oldValue !== value)
        {
            _internal_interpreter = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "interpreter", oldValue, _internal_interpreter));
        }
    }

    public function set image_year(value:int) : void
    {
        var oldValue:int = _internal_image_year;
        if (oldValue !== value)
        {
            _internal_image_year = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "image_year", oldValue, _internal_image_year));
        }
    }

    public function set end_otherLandcover(value:String) : void
    {
        var oldValue:String = _internal_end_otherLandcover;
        if (oldValue !== value)
        {
            _internal_end_otherLandcover = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_otherLandcover", oldValue, _internal_end_otherLandcover));
        }
    }

    public function set project_id(value:int) : void
    {
        var oldValue:int = _internal_project_id;
        if (oldValue !== value)
        {
            _internal_project_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "project_id", oldValue, _internal_project_id));
        }
    }

    public function set end_dominantLandcover(value:String) : void
    {
        var oldValue:String = _internal_end_dominantLandcover;
        if (oldValue !== value)
        {
            _internal_end_dominantLandcover = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_dominantLandcover", oldValue, _internal_end_dominantLandcover));
        }
    }

    public function set other_landuse(value:String) : void
    {
        var oldValue:String = _internal_other_landuse;
        if (oldValue !== value)
        {
            _internal_other_landuse = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landuse", oldValue, _internal_other_landuse));
        }
    }

    public function set landuse_confidence(value:String) : void
    {
        var oldValue:String = _internal_landuse_confidence;
        if (oldValue !== value)
        {
            _internal_landuse_confidence = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landuse_confidence", oldValue, _internal_landuse_confidence));
        }
    }

    public function set dominant_landcover_lt50(value:int) : void
    {
        var oldValue:int = _internal_dominant_landcover_lt50;
        if (oldValue !== value)
        {
            _internal_dominant_landcover_lt50 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landcover_lt50", oldValue, _internal_dominant_landcover_lt50));
        }
    }

    public function set dominant_landuse_lt50(value:int) : void
    {
        var oldValue:int = _internal_dominant_landuse_lt50;
        if (oldValue !== value)
        {
            _internal_dominant_landuse_lt50 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landuse_lt50", oldValue, _internal_dominant_landuse_lt50));
        }
    }

    public function set groups(value:int) : void
    {
        var oldValue:int = _internal_groups;
        if (oldValue !== value)
        {
            _internal_groups = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "groups", oldValue, _internal_groups));
        }
    }

    public function set landcover_confidence(value:String) : void
    {
        var oldValue:String = _internal_landcover_confidence;
        if (oldValue !== value)
        {
            _internal_landcover_confidence = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landcover_confidence", oldValue, _internal_landcover_confidence));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerEnd_landcover(value:flash.events.Event):void
    {
        _model.invalidateDependentOnEnd_landcover();
    }

    model_internal function setterListenerDominant_landcover(value:flash.events.Event):void
    {
        _model.invalidateDependentOnDominant_landcover();
    }

    model_internal function setterListenerDominant_landuse(value:flash.events.Event):void
    {
        _model.invalidateDependentOnDominant_landuse();
    }

    model_internal function setterListenerOther_landcover(value:flash.events.Event):void
    {
        _model.invalidateDependentOnOther_landcover();
    }

    model_internal function setterListenerCategory(value:flash.events.Event):void
    {
        _model.invalidateDependentOnCategory();
    }

    model_internal function setterListenerEnd_otherLandcover(value:flash.events.Event):void
    {
        _model.invalidateDependentOnEnd_otherLandcover();
    }

    model_internal function setterListenerEnd_dominantLandcover(value:flash.events.Event):void
    {
        _model.invalidateDependentOnEnd_dominantLandcover();
    }

    model_internal function setterListenerOther_landuse(value:flash.events.Event):void
    {
        _model.invalidateDependentOnOther_landuse();
    }

    model_internal function setterListenerLanduse_confidence(value:flash.events.Event):void
    {
        _model.invalidateDependentOnLanduse_confidence();
    }

    model_internal function setterListenerLandcover_confidence(value:flash.events.Event):void
    {
        _model.invalidateDependentOnLandcover_confidence();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */
    

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.end_landcoverIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_end_landcoverValidationFailureMessages);
        }
        if (!_model.dominant_landcoverIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_dominant_landcoverValidationFailureMessages);
        }
        if (!_model.dominant_landuseIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_dominant_landuseValidationFailureMessages);
        }
        if (!_model.other_landcoverIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_other_landcoverValidationFailureMessages);
        }
        if (!_model.categoryIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_categoryValidationFailureMessages);
        }
        if (!_model.end_otherLandcoverIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_end_otherLandcoverValidationFailureMessages);
        }
        if (!_model.end_dominantLandcoverIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_end_dominantLandcoverValidationFailureMessages);
        }
        if (!_model.other_landuseIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_other_landuseValidationFailureMessages);
        }
        if (!_model.landuse_confidenceIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_landuse_confidenceValidationFailureMessages);
        }
        if (!_model.landcover_confidenceIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_landcover_confidenceValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _LuLcEntryEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _LuLcEntryEntityMetadata) : void
    {
        var oldValue : _LuLcEntryEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfEnd_landcover : Array = null;
    model_internal var _doValidationLastValOfEnd_landcover : String;

    model_internal function _doValidationForEnd_landcover(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfEnd_landcover != null && model_internal::_doValidationLastValOfEnd_landcover == value)
           return model_internal::_doValidationCacheOfEnd_landcover ;

        _model.model_internal::_end_landcoverIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isEnd_landcoverAvailable && _internal_end_landcover == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "end_landcover is required"));
        }

        model_internal::_doValidationCacheOfEnd_landcover = validationFailures;
        model_internal::_doValidationLastValOfEnd_landcover = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfDominant_landcover : Array = null;
    model_internal var _doValidationLastValOfDominant_landcover : String;

    model_internal function _doValidationForDominant_landcover(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfDominant_landcover != null && model_internal::_doValidationLastValOfDominant_landcover == value)
           return model_internal::_doValidationCacheOfDominant_landcover ;

        _model.model_internal::_dominant_landcoverIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isDominant_landcoverAvailable && _internal_dominant_landcover == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "dominant_landcover is required"));
        }

        model_internal::_doValidationCacheOfDominant_landcover = validationFailures;
        model_internal::_doValidationLastValOfDominant_landcover = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfDominant_landuse : Array = null;
    model_internal var _doValidationLastValOfDominant_landuse : String;

    model_internal function _doValidationForDominant_landuse(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfDominant_landuse != null && model_internal::_doValidationLastValOfDominant_landuse == value)
           return model_internal::_doValidationCacheOfDominant_landuse ;

        _model.model_internal::_dominant_landuseIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isDominant_landuseAvailable && _internal_dominant_landuse == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "dominant_landuse is required"));
        }

        model_internal::_doValidationCacheOfDominant_landuse = validationFailures;
        model_internal::_doValidationLastValOfDominant_landuse = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfOther_landcover : Array = null;
    model_internal var _doValidationLastValOfOther_landcover : String;

    model_internal function _doValidationForOther_landcover(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfOther_landcover != null && model_internal::_doValidationLastValOfOther_landcover == value)
           return model_internal::_doValidationCacheOfOther_landcover ;

        _model.model_internal::_other_landcoverIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isOther_landcoverAvailable && _internal_other_landcover == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "other_landcover is required"));
        }

        model_internal::_doValidationCacheOfOther_landcover = validationFailures;
        model_internal::_doValidationLastValOfOther_landcover = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfCategory : Array = null;
    model_internal var _doValidationLastValOfCategory : String;

    model_internal function _doValidationForCategory(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfCategory != null && model_internal::_doValidationLastValOfCategory == value)
           return model_internal::_doValidationCacheOfCategory ;

        _model.model_internal::_categoryIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isCategoryAvailable && _internal_category == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "category is required"));
        }

        model_internal::_doValidationCacheOfCategory = validationFailures;
        model_internal::_doValidationLastValOfCategory = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfEnd_otherLandcover : Array = null;
    model_internal var _doValidationLastValOfEnd_otherLandcover : String;

    model_internal function _doValidationForEnd_otherLandcover(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfEnd_otherLandcover != null && model_internal::_doValidationLastValOfEnd_otherLandcover == value)
           return model_internal::_doValidationCacheOfEnd_otherLandcover ;

        _model.model_internal::_end_otherLandcoverIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isEnd_otherLandcoverAvailable && _internal_end_otherLandcover == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "end_otherLandcover is required"));
        }

        model_internal::_doValidationCacheOfEnd_otherLandcover = validationFailures;
        model_internal::_doValidationLastValOfEnd_otherLandcover = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfEnd_dominantLandcover : Array = null;
    model_internal var _doValidationLastValOfEnd_dominantLandcover : String;

    model_internal function _doValidationForEnd_dominantLandcover(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfEnd_dominantLandcover != null && model_internal::_doValidationLastValOfEnd_dominantLandcover == value)
           return model_internal::_doValidationCacheOfEnd_dominantLandcover ;

        _model.model_internal::_end_dominantLandcoverIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isEnd_dominantLandcoverAvailable && _internal_end_dominantLandcover == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "end_dominantLandcover is required"));
        }

        model_internal::_doValidationCacheOfEnd_dominantLandcover = validationFailures;
        model_internal::_doValidationLastValOfEnd_dominantLandcover = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfOther_landuse : Array = null;
    model_internal var _doValidationLastValOfOther_landuse : String;

    model_internal function _doValidationForOther_landuse(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfOther_landuse != null && model_internal::_doValidationLastValOfOther_landuse == value)
           return model_internal::_doValidationCacheOfOther_landuse ;

        _model.model_internal::_other_landuseIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isOther_landuseAvailable && _internal_other_landuse == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "other_landuse is required"));
        }

        model_internal::_doValidationCacheOfOther_landuse = validationFailures;
        model_internal::_doValidationLastValOfOther_landuse = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfLanduse_confidence : Array = null;
    model_internal var _doValidationLastValOfLanduse_confidence : String;

    model_internal function _doValidationForLanduse_confidence(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfLanduse_confidence != null && model_internal::_doValidationLastValOfLanduse_confidence == value)
           return model_internal::_doValidationCacheOfLanduse_confidence ;

        _model.model_internal::_landuse_confidenceIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isLanduse_confidenceAvailable && _internal_landuse_confidence == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "landuse_confidence is required"));
        }

        model_internal::_doValidationCacheOfLanduse_confidence = validationFailures;
        model_internal::_doValidationLastValOfLanduse_confidence = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfLandcover_confidence : Array = null;
    model_internal var _doValidationLastValOfLandcover_confidence : String;

    model_internal function _doValidationForLandcover_confidence(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfLandcover_confidence != null && model_internal::_doValidationLastValOfLandcover_confidence == value)
           return model_internal::_doValidationCacheOfLandcover_confidence ;

        _model.model_internal::_landcover_confidenceIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isLandcover_confidenceAvailable && _internal_landcover_confidence == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "landcover_confidence is required"));
        }

        model_internal::_doValidationCacheOfLandcover_confidence = validationFailures;
        model_internal::_doValidationLastValOfLandcover_confidence = value;

        return validationFailures;
    }
    

}

}
