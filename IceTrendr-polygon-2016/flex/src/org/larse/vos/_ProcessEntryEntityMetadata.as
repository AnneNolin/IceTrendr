
/**
 * This is a generated class and is not intended for modification.  
 */
package org.larse.vos
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _ProcessEntryEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("tsa", "iscomplete", "issnow", "iswrongyear", "plotid", "shape", "process", "iscloud", "interpreter", "trajectory", "project_id", "ispartialpatch", "ismisregistration", "context", "isphenology", "groups", "comments");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("tsa", "iscomplete", "issnow", "iswrongyear", "plotid", "shape", "process", "iscloud", "interpreter", "trajectory", "project_id", "ispartialpatch", "ismisregistration", "context", "isphenology", "groups", "comments");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("tsa", "iscomplete", "issnow", "iswrongyear", "plotid", "shape", "process", "iscloud", "interpreter", "trajectory", "project_id", "ispartialpatch", "ismisregistration", "context", "isphenology", "groups", "comments");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("tsa", "iscomplete", "issnow", "iswrongyear", "plotid", "shape", "process", "iscloud", "interpreter", "trajectory", "project_id", "ispartialpatch", "ismisregistration", "context", "isphenology", "groups", "comments");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("tsa", "iscomplete", "issnow", "iswrongyear", "plotid", "shape", "process", "iscloud", "interpreter", "trajectory", "project_id", "ispartialpatch", "ismisregistration", "context", "isphenology", "groups", "comments");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "ProcessEntry";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _shapeIsValid:Boolean;
    model_internal var _shapeValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _shapeIsValidCacheInitialized:Boolean = false;
    model_internal var _shapeValidationFailureMessages:Array;
    
    model_internal var _processIsValid:Boolean;
    model_internal var _processValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _processIsValidCacheInitialized:Boolean = false;
    model_internal var _processValidationFailureMessages:Array;
    
    model_internal var _trajectoryIsValid:Boolean;
    model_internal var _trajectoryValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _trajectoryIsValidCacheInitialized:Boolean = false;
    model_internal var _trajectoryValidationFailureMessages:Array;
    
    model_internal var _contextIsValid:Boolean;
    model_internal var _contextValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _contextIsValidCacheInitialized:Boolean = false;
    model_internal var _contextValidationFailureMessages:Array;
    
    model_internal var _commentsIsValid:Boolean;
    model_internal var _commentsValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _commentsIsValidCacheInitialized:Boolean = false;
    model_internal var _commentsValidationFailureMessages:Array;

    model_internal var _instance:_Super_ProcessEntry;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _ProcessEntryEntityMetadata(value : _Super_ProcessEntry)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["tsa"] = new Array();
            model_internal::dependentsOnMap["iscomplete"] = new Array();
            model_internal::dependentsOnMap["issnow"] = new Array();
            model_internal::dependentsOnMap["iswrongyear"] = new Array();
            model_internal::dependentsOnMap["plotid"] = new Array();
            model_internal::dependentsOnMap["shape"] = new Array();
            model_internal::dependentsOnMap["process"] = new Array();
            model_internal::dependentsOnMap["iscloud"] = new Array();
            model_internal::dependentsOnMap["interpreter"] = new Array();
            model_internal::dependentsOnMap["trajectory"] = new Array();
            model_internal::dependentsOnMap["project_id"] = new Array();
            model_internal::dependentsOnMap["ispartialpatch"] = new Array();
            model_internal::dependentsOnMap["ismisregistration"] = new Array();
            model_internal::dependentsOnMap["context"] = new Array();
            model_internal::dependentsOnMap["isphenology"] = new Array();
            model_internal::dependentsOnMap["groups"] = new Array();
            model_internal::dependentsOnMap["comments"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["tsa"] = "int";
        model_internal::propertyTypeMap["iscomplete"] = "int";
        model_internal::propertyTypeMap["issnow"] = "int";
        model_internal::propertyTypeMap["iswrongyear"] = "int";
        model_internal::propertyTypeMap["plotid"] = "int";
        model_internal::propertyTypeMap["shape"] = "String";
        model_internal::propertyTypeMap["process"] = "String";
        model_internal::propertyTypeMap["iscloud"] = "int";
        model_internal::propertyTypeMap["interpreter"] = "int";
        model_internal::propertyTypeMap["trajectory"] = "String";
        model_internal::propertyTypeMap["project_id"] = "int";
        model_internal::propertyTypeMap["ispartialpatch"] = "int";
        model_internal::propertyTypeMap["ismisregistration"] = "int";
        model_internal::propertyTypeMap["context"] = "String";
        model_internal::propertyTypeMap["isphenology"] = "int";
        model_internal::propertyTypeMap["groups"] = "int";
        model_internal::propertyTypeMap["comments"] = "String";

        model_internal::_instance = value;
        model_internal::_shapeValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForShape);
        model_internal::_shapeValidator.required = true;
        model_internal::_shapeValidator.requiredFieldError = "shape is required";
        //model_internal::_shapeValidator.source = model_internal::_instance;
        //model_internal::_shapeValidator.property = "shape";
        model_internal::_processValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForProcess);
        model_internal::_processValidator.required = true;
        model_internal::_processValidator.requiredFieldError = "process is required";
        //model_internal::_processValidator.source = model_internal::_instance;
        //model_internal::_processValidator.property = "process";
        model_internal::_trajectoryValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForTrajectory);
        model_internal::_trajectoryValidator.required = true;
        model_internal::_trajectoryValidator.requiredFieldError = "trajectory is required";
        //model_internal::_trajectoryValidator.source = model_internal::_instance;
        //model_internal::_trajectoryValidator.property = "trajectory";
        model_internal::_contextValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForContext);
        model_internal::_contextValidator.required = true;
        model_internal::_contextValidator.requiredFieldError = "context is required";
        //model_internal::_contextValidator.source = model_internal::_instance;
        //model_internal::_contextValidator.property = "context";
        model_internal::_commentsValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForComments);
        model_internal::_commentsValidator.required = true;
        model_internal::_commentsValidator.requiredFieldError = "comments is required";
        //model_internal::_commentsValidator.source = model_internal::_instance;
        //model_internal::_commentsValidator.property = "comments";
    }

    override public function getEntityName():String
    {
        return model_internal::entityName;
    }

    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }

    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }

    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }

    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }

    public function getSourceProperties():Array
    {
        return model_internal::sourceProperties;
    }

    public function getNonDerivedProperties():Array
    {
        return model_internal::nonDerivedProperties;
    }

    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }

    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }

    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity ProcessEntry");
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }

    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }

    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }

    override public function getCollectionBase(propertyName:String):String
    {
        if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity ProcessEntry");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of ProcessEntry");

        return model_internal::propertyTypeMap[propertyName];
    }

    override public function getAvailableProperties():com.adobe.fiber.valueobjects.IPropertyIterator
    {
        return new com.adobe.fiber.valueobjects.AvailablePropertyIterator(this);
    }

    override public function getValue(propertyName:String):*
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity ProcessEntry");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity ProcessEntry");
        }

        model_internal::_instance[propertyName] = value;
    }

    override public function getMappedByProperty(associationProperty:String):String
    {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }
    }

    override public function getPropertyLength(propertyName:String):int
    {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }
    }

    override public function isAvailable(propertyName:String):Boolean
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity ProcessEntry");
        }

        if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
        {
            return true;
        }

        switch(propertyName)
        {
            default:
            {
                return true;
            }
        }
    }

    override public function getIdentityMap():Object
    {
        var returnMap:Object = new Object();

        return returnMap;
    }

    [Bindable(event="propertyChange")]
    override public function get invalidConstraints():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }
    }

    [Bindable(event="propertyChange")]
    override public function get validationFailureMessages():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
    }

    override public function getDependantInvalidConstraints(propertyName:String):Array
    {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }

        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }

        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;
        }

        return currentlyInvalid.filter(filterFunc);
    }

    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;
        }
    }

    [Bindable(event="propertyChange")]
    public function get isTsaAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIscompleteAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIssnowAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIswrongyearAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPlotidAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isShapeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isProcessAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIscloudAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isInterpreterAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTrajectoryAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isProject_idAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIspartialpatchAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIsmisregistrationAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isContextAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIsphenologyAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isGroupsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCommentsAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnShape():void
    {
        if (model_internal::_shapeIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfShape = null;
            model_internal::calculateShapeIsValid();
        }
    }
    public function invalidateDependentOnProcess():void
    {
        if (model_internal::_processIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfProcess = null;
            model_internal::calculateProcessIsValid();
        }
    }
    public function invalidateDependentOnTrajectory():void
    {
        if (model_internal::_trajectoryIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfTrajectory = null;
            model_internal::calculateTrajectoryIsValid();
        }
    }
    public function invalidateDependentOnContext():void
    {
        if (model_internal::_contextIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfContext = null;
            model_internal::calculateContextIsValid();
        }
    }
    public function invalidateDependentOnComments():void
    {
        if (model_internal::_commentsIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfComments = null;
            model_internal::calculateCommentsIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get tsaStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get iscompleteStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get issnowStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get iswrongyearStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get plotidStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get shapeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get shapeValidator() : StyleValidator
    {
        return model_internal::_shapeValidator;
    }

    model_internal function set _shapeIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_shapeIsValid;         
        if (oldValue !== value)
        {
            model_internal::_shapeIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "shapeIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get shapeIsValid():Boolean
    {
        if (!model_internal::_shapeIsValidCacheInitialized)
        {
            model_internal::calculateShapeIsValid();
        }

        return model_internal::_shapeIsValid;
    }

    model_internal function calculateShapeIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_shapeValidator.validate(model_internal::_instance.shape)
        model_internal::_shapeIsValid_der = (valRes.results == null);
        model_internal::_shapeIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::shapeValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::shapeValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get shapeValidationFailureMessages():Array
    {
        if (model_internal::_shapeValidationFailureMessages == null)
            model_internal::calculateShapeIsValid();

        return _shapeValidationFailureMessages;
    }

    model_internal function set shapeValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_shapeValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_shapeValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "shapeValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get processStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get processValidator() : StyleValidator
    {
        return model_internal::_processValidator;
    }

    model_internal function set _processIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_processIsValid;         
        if (oldValue !== value)
        {
            model_internal::_processIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "processIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get processIsValid():Boolean
    {
        if (!model_internal::_processIsValidCacheInitialized)
        {
            model_internal::calculateProcessIsValid();
        }

        return model_internal::_processIsValid;
    }

    model_internal function calculateProcessIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_processValidator.validate(model_internal::_instance.process)
        model_internal::_processIsValid_der = (valRes.results == null);
        model_internal::_processIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::processValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::processValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get processValidationFailureMessages():Array
    {
        if (model_internal::_processValidationFailureMessages == null)
            model_internal::calculateProcessIsValid();

        return _processValidationFailureMessages;
    }

    model_internal function set processValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_processValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_processValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "processValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get iscloudStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get interpreterStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get trajectoryStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get trajectoryValidator() : StyleValidator
    {
        return model_internal::_trajectoryValidator;
    }

    model_internal function set _trajectoryIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_trajectoryIsValid;         
        if (oldValue !== value)
        {
            model_internal::_trajectoryIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trajectoryIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get trajectoryIsValid():Boolean
    {
        if (!model_internal::_trajectoryIsValidCacheInitialized)
        {
            model_internal::calculateTrajectoryIsValid();
        }

        return model_internal::_trajectoryIsValid;
    }

    model_internal function calculateTrajectoryIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_trajectoryValidator.validate(model_internal::_instance.trajectory)
        model_internal::_trajectoryIsValid_der = (valRes.results == null);
        model_internal::_trajectoryIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::trajectoryValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::trajectoryValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get trajectoryValidationFailureMessages():Array
    {
        if (model_internal::_trajectoryValidationFailureMessages == null)
            model_internal::calculateTrajectoryIsValid();

        return _trajectoryValidationFailureMessages;
    }

    model_internal function set trajectoryValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_trajectoryValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_trajectoryValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trajectoryValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get project_idStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get ispartialpatchStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get ismisregistrationStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get contextStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get contextValidator() : StyleValidator
    {
        return model_internal::_contextValidator;
    }

    model_internal function set _contextIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_contextIsValid;         
        if (oldValue !== value)
        {
            model_internal::_contextIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "contextIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get contextIsValid():Boolean
    {
        if (!model_internal::_contextIsValidCacheInitialized)
        {
            model_internal::calculateContextIsValid();
        }

        return model_internal::_contextIsValid;
    }

    model_internal function calculateContextIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_contextValidator.validate(model_internal::_instance.context)
        model_internal::_contextIsValid_der = (valRes.results == null);
        model_internal::_contextIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::contextValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::contextValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get contextValidationFailureMessages():Array
    {
        if (model_internal::_contextValidationFailureMessages == null)
            model_internal::calculateContextIsValid();

        return _contextValidationFailureMessages;
    }

    model_internal function set contextValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_contextValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_contextValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "contextValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get isphenologyStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get groupsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get commentsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get commentsValidator() : StyleValidator
    {
        return model_internal::_commentsValidator;
    }

    model_internal function set _commentsIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_commentsIsValid;         
        if (oldValue !== value)
        {
            model_internal::_commentsIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "commentsIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get commentsIsValid():Boolean
    {
        if (!model_internal::_commentsIsValidCacheInitialized)
        {
            model_internal::calculateCommentsIsValid();
        }

        return model_internal::_commentsIsValid;
    }

    model_internal function calculateCommentsIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_commentsValidator.validate(model_internal::_instance.comments)
        model_internal::_commentsIsValid_der = (valRes.results == null);
        model_internal::_commentsIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::commentsValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::commentsValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get commentsValidationFailureMessages():Array
    {
        if (model_internal::_commentsValidationFailureMessages == null)
            model_internal::calculateCommentsIsValid();

        return _commentsValidationFailureMessages;
    }

    model_internal function set commentsValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_commentsValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_commentsValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "commentsValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }


     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):com.adobe.fiber.styles.IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            case("shape"):
            {
                return shapeValidationFailureMessages;
            }
            case("process"):
            {
                return processValidationFailureMessages;
            }
            case("trajectory"):
            {
                return trajectoryValidationFailureMessages;
            }
            case("context"):
            {
                return contextValidationFailureMessages;
            }
            case("comments"):
            {
                return commentsValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
