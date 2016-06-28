/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - ProcessEntry.as.
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
public class _Super_ProcessEntry extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _ProcessEntryEntityMetadata;
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
    private var _internal_tsa : int;
    private var _internal_iscomplete : int;
    private var _internal_issnow : int;
    private var _internal_iswrongyear : int;
    private var _internal_plotid : int;
    private var _internal_shape : String;
    private var _internal_process : String;
    private var _internal_iscloud : int;
    private var _internal_interpreter : int;
    private var _internal_trajectory : String;
    private var _internal_project_id : int;
    private var _internal_ispartialpatch : int;
    private var _internal_ismisregistration : int;
    private var _internal_context : String;
    private var _internal_isphenology : int;
    private var _internal_groups : int;
    private var _internal_comments : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_ProcessEntry()
    {
        _model = new _ProcessEntryEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "shape", model_internal::setterListenerShape));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "process", model_internal::setterListenerProcess));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "trajectory", model_internal::setterListenerTrajectory));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "context", model_internal::setterListenerContext));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "comments", model_internal::setterListenerComments));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get tsa() : int
    {
        return _internal_tsa;
    }

    [Bindable(event="propertyChange")]
    public function get iscomplete() : int
    {
        return _internal_iscomplete;
    }

    [Bindable(event="propertyChange")]
    public function get issnow() : int
    {
        return _internal_issnow;
    }

    [Bindable(event="propertyChange")]
    public function get iswrongyear() : int
    {
        return _internal_iswrongyear;
    }

    [Bindable(event="propertyChange")]
    public function get plotid() : int
    {
        return _internal_plotid;
    }

    [Bindable(event="propertyChange")]
    public function get shape() : String
    {
        return _internal_shape;
    }

    [Bindable(event="propertyChange")]
    public function get process() : String
    {
        return _internal_process;
    }

    [Bindable(event="propertyChange")]
    public function get iscloud() : int
    {
        return _internal_iscloud;
    }

    [Bindable(event="propertyChange")]
    public function get interpreter() : int
    {
        return _internal_interpreter;
    }

    [Bindable(event="propertyChange")]
    public function get trajectory() : String
    {
        return _internal_trajectory;
    }

    [Bindable(event="propertyChange")]
    public function get project_id() : int
    {
        return _internal_project_id;
    }

    [Bindable(event="propertyChange")]
    public function get ispartialpatch() : int
    {
        return _internal_ispartialpatch;
    }

    [Bindable(event="propertyChange")]
    public function get ismisregistration() : int
    {
        return _internal_ismisregistration;
    }

    [Bindable(event="propertyChange")]
    public function get context() : String
    {
        return _internal_context;
    }

    [Bindable(event="propertyChange")]
    public function get isphenology() : int
    {
        return _internal_isphenology;
    }

    [Bindable(event="propertyChange")]
    public function get groups() : int
    {
        return _internal_groups;
    }

    [Bindable(event="propertyChange")]
    public function get comments() : String
    {
        return _internal_comments;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set tsa(value:int) : void
    {
        var oldValue:int = _internal_tsa;
        if (oldValue !== value)
        {
            _internal_tsa = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tsa", oldValue, _internal_tsa));
        }
    }

    public function set iscomplete(value:int) : void
    {
        var oldValue:int = _internal_iscomplete;
        if (oldValue !== value)
        {
            _internal_iscomplete = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "iscomplete", oldValue, _internal_iscomplete));
        }
    }

    public function set issnow(value:int) : void
    {
        var oldValue:int = _internal_issnow;
        if (oldValue !== value)
        {
            _internal_issnow = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "issnow", oldValue, _internal_issnow));
        }
    }

    public function set iswrongyear(value:int) : void
    {
        var oldValue:int = _internal_iswrongyear;
        if (oldValue !== value)
        {
            _internal_iswrongyear = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "iswrongyear", oldValue, _internal_iswrongyear));
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

    public function set shape(value:String) : void
    {
        var oldValue:String = _internal_shape;
        if (oldValue !== value)
        {
            _internal_shape = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "shape", oldValue, _internal_shape));
        }
    }

    public function set process(value:String) : void
    {
        var oldValue:String = _internal_process;
        if (oldValue !== value)
        {
            _internal_process = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "process", oldValue, _internal_process));
        }
    }

    public function set iscloud(value:int) : void
    {
        var oldValue:int = _internal_iscloud;
        if (oldValue !== value)
        {
            _internal_iscloud = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "iscloud", oldValue, _internal_iscloud));
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

    public function set trajectory(value:String) : void
    {
        var oldValue:String = _internal_trajectory;
        if (oldValue !== value)
        {
            _internal_trajectory = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trajectory", oldValue, _internal_trajectory));
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

    public function set ispartialpatch(value:int) : void
    {
        var oldValue:int = _internal_ispartialpatch;
        if (oldValue !== value)
        {
            _internal_ispartialpatch = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ispartialpatch", oldValue, _internal_ispartialpatch));
        }
    }

    public function set ismisregistration(value:int) : void
    {
        var oldValue:int = _internal_ismisregistration;
        if (oldValue !== value)
        {
            _internal_ismisregistration = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ismisregistration", oldValue, _internal_ismisregistration));
        }
    }

    public function set context(value:String) : void
    {
        var oldValue:String = _internal_context;
        if (oldValue !== value)
        {
            _internal_context = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "context", oldValue, _internal_context));
        }
    }

    public function set isphenology(value:int) : void
    {
        var oldValue:int = _internal_isphenology;
        if (oldValue !== value)
        {
            _internal_isphenology = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "isphenology", oldValue, _internal_isphenology));
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

    public function set comments(value:String) : void
    {
        var oldValue:String = _internal_comments;
        if (oldValue !== value)
        {
            _internal_comments = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "comments", oldValue, _internal_comments));
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

    model_internal function setterListenerShape(value:flash.events.Event):void
    {
        _model.invalidateDependentOnShape();
    }

    model_internal function setterListenerProcess(value:flash.events.Event):void
    {
        _model.invalidateDependentOnProcess();
    }

    model_internal function setterListenerTrajectory(value:flash.events.Event):void
    {
        _model.invalidateDependentOnTrajectory();
    }

    model_internal function setterListenerContext(value:flash.events.Event):void
    {
        _model.invalidateDependentOnContext();
    }

    model_internal function setterListenerComments(value:flash.events.Event):void
    {
        _model.invalidateDependentOnComments();
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
        if (!_model.shapeIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_shapeValidationFailureMessages);
        }
        if (!_model.processIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_processValidationFailureMessages);
        }
        if (!_model.trajectoryIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_trajectoryValidationFailureMessages);
        }
        if (!_model.contextIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_contextValidationFailureMessages);
        }
        if (!_model.commentsIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_commentsValidationFailureMessages);
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
    public function get _model() : _ProcessEntryEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _ProcessEntryEntityMetadata) : void
    {
        var oldValue : _ProcessEntryEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfShape : Array = null;
    model_internal var _doValidationLastValOfShape : String;

    model_internal function _doValidationForShape(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfShape != null && model_internal::_doValidationLastValOfShape == value)
           return model_internal::_doValidationCacheOfShape ;

        _model.model_internal::_shapeIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isShapeAvailable && _internal_shape == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "shape is required"));
        }

        model_internal::_doValidationCacheOfShape = validationFailures;
        model_internal::_doValidationLastValOfShape = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfProcess : Array = null;
    model_internal var _doValidationLastValOfProcess : String;

    model_internal function _doValidationForProcess(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfProcess != null && model_internal::_doValidationLastValOfProcess == value)
           return model_internal::_doValidationCacheOfProcess ;

        _model.model_internal::_processIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isProcessAvailable && _internal_process == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "process is required"));
        }

        model_internal::_doValidationCacheOfProcess = validationFailures;
        model_internal::_doValidationLastValOfProcess = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfTrajectory : Array = null;
    model_internal var _doValidationLastValOfTrajectory : String;

    model_internal function _doValidationForTrajectory(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfTrajectory != null && model_internal::_doValidationLastValOfTrajectory == value)
           return model_internal::_doValidationCacheOfTrajectory ;

        _model.model_internal::_trajectoryIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isTrajectoryAvailable && _internal_trajectory == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "trajectory is required"));
        }

        model_internal::_doValidationCacheOfTrajectory = validationFailures;
        model_internal::_doValidationLastValOfTrajectory = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfContext : Array = null;
    model_internal var _doValidationLastValOfContext : String;

    model_internal function _doValidationForContext(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfContext != null && model_internal::_doValidationLastValOfContext == value)
           return model_internal::_doValidationCacheOfContext ;

        _model.model_internal::_contextIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isContextAvailable && _internal_context == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "context is required"));
        }

        model_internal::_doValidationCacheOfContext = validationFailures;
        model_internal::_doValidationLastValOfContext = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfComments : Array = null;
    model_internal var _doValidationLastValOfComments : String;

    model_internal function _doValidationForComments(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfComments != null && model_internal::_doValidationLastValOfComments == value)
           return model_internal::_doValidationCacheOfComments ;

        _model.model_internal::_commentsIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isCommentsAvailable && _internal_comments == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "comments is required"));
        }

        model_internal::_doValidationCacheOfComments = validationFailures;
        model_internal::_doValidationLastValOfComments = value;

        return validationFailures;
    }
    

}

}
