
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
internal class _LuLcEntryEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("end_landcover", "tsa", "dominant_landcover", "image_julday", "plotid", "dominant_landuse", "other_landcover", "category", "interpreter", "image_year", "end_otherLandcover", "project_id", "end_dominantLandcover", "other_landuse", "landuse_confidence", "dominant_landcover_lt50", "dominant_landuse_lt50", "groups", "landcover_confidence");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("end_landcover", "tsa", "dominant_landcover", "image_julday", "plotid", "dominant_landuse", "other_landcover", "category", "interpreter", "image_year", "end_otherLandcover", "project_id", "end_dominantLandcover", "other_landuse", "landuse_confidence", "dominant_landcover_lt50", "dominant_landuse_lt50", "groups", "landcover_confidence");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("end_landcover", "tsa", "dominant_landcover", "image_julday", "plotid", "dominant_landuse", "other_landcover", "category", "interpreter", "image_year", "end_otherLandcover", "project_id", "end_dominantLandcover", "other_landuse", "landuse_confidence", "dominant_landcover_lt50", "dominant_landuse_lt50", "groups", "landcover_confidence");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("end_landcover", "tsa", "dominant_landcover", "image_julday", "plotid", "dominant_landuse", "other_landcover", "category", "interpreter", "image_year", "end_otherLandcover", "project_id", "end_dominantLandcover", "other_landuse", "landuse_confidence", "dominant_landcover_lt50", "dominant_landuse_lt50", "groups", "landcover_confidence");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("end_landcover", "tsa", "dominant_landcover", "image_julday", "plotid", "dominant_landuse", "other_landcover", "category", "interpreter", "image_year", "end_otherLandcover", "project_id", "end_dominantLandcover", "other_landuse", "landuse_confidence", "dominant_landcover_lt50", "dominant_landuse_lt50", "groups", "landcover_confidence");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "LuLcEntry";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _end_landcoverIsValid:Boolean;
    model_internal var _end_landcoverValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _end_landcoverIsValidCacheInitialized:Boolean = false;
    model_internal var _end_landcoverValidationFailureMessages:Array;
    
    model_internal var _dominant_landcoverIsValid:Boolean;
    model_internal var _dominant_landcoverValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _dominant_landcoverIsValidCacheInitialized:Boolean = false;
    model_internal var _dominant_landcoverValidationFailureMessages:Array;
    
    model_internal var _dominant_landuseIsValid:Boolean;
    model_internal var _dominant_landuseValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _dominant_landuseIsValidCacheInitialized:Boolean = false;
    model_internal var _dominant_landuseValidationFailureMessages:Array;
    
    model_internal var _other_landcoverIsValid:Boolean;
    model_internal var _other_landcoverValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _other_landcoverIsValidCacheInitialized:Boolean = false;
    model_internal var _other_landcoverValidationFailureMessages:Array;
    
    model_internal var _categoryIsValid:Boolean;
    model_internal var _categoryValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _categoryIsValidCacheInitialized:Boolean = false;
    model_internal var _categoryValidationFailureMessages:Array;
    
    model_internal var _end_otherLandcoverIsValid:Boolean;
    model_internal var _end_otherLandcoverValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _end_otherLandcoverIsValidCacheInitialized:Boolean = false;
    model_internal var _end_otherLandcoverValidationFailureMessages:Array;
    
    model_internal var _end_dominantLandcoverIsValid:Boolean;
    model_internal var _end_dominantLandcoverValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _end_dominantLandcoverIsValidCacheInitialized:Boolean = false;
    model_internal var _end_dominantLandcoverValidationFailureMessages:Array;
    
    model_internal var _other_landuseIsValid:Boolean;
    model_internal var _other_landuseValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _other_landuseIsValidCacheInitialized:Boolean = false;
    model_internal var _other_landuseValidationFailureMessages:Array;
    
    model_internal var _landuse_confidenceIsValid:Boolean;
    model_internal var _landuse_confidenceValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _landuse_confidenceIsValidCacheInitialized:Boolean = false;
    model_internal var _landuse_confidenceValidationFailureMessages:Array;
    
    model_internal var _landcover_confidenceIsValid:Boolean;
    model_internal var _landcover_confidenceValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _landcover_confidenceIsValidCacheInitialized:Boolean = false;
    model_internal var _landcover_confidenceValidationFailureMessages:Array;

    model_internal var _instance:_Super_LuLcEntry;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _LuLcEntryEntityMetadata(value : _Super_LuLcEntry)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["end_landcover"] = new Array();
            model_internal::dependentsOnMap["tsa"] = new Array();
            model_internal::dependentsOnMap["dominant_landcover"] = new Array();
            model_internal::dependentsOnMap["image_julday"] = new Array();
            model_internal::dependentsOnMap["plotid"] = new Array();
            model_internal::dependentsOnMap["dominant_landuse"] = new Array();
            model_internal::dependentsOnMap["other_landcover"] = new Array();
            model_internal::dependentsOnMap["category"] = new Array();
            model_internal::dependentsOnMap["interpreter"] = new Array();
            model_internal::dependentsOnMap["image_year"] = new Array();
            model_internal::dependentsOnMap["end_otherLandcover"] = new Array();
            model_internal::dependentsOnMap["project_id"] = new Array();
            model_internal::dependentsOnMap["end_dominantLandcover"] = new Array();
            model_internal::dependentsOnMap["other_landuse"] = new Array();
            model_internal::dependentsOnMap["landuse_confidence"] = new Array();
            model_internal::dependentsOnMap["dominant_landcover_lt50"] = new Array();
            model_internal::dependentsOnMap["dominant_landuse_lt50"] = new Array();
            model_internal::dependentsOnMap["groups"] = new Array();
            model_internal::dependentsOnMap["landcover_confidence"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["end_landcover"] = "String";
        model_internal::propertyTypeMap["tsa"] = "int";
        model_internal::propertyTypeMap["dominant_landcover"] = "String";
        model_internal::propertyTypeMap["image_julday"] = "int";
        model_internal::propertyTypeMap["plotid"] = "int";
        model_internal::propertyTypeMap["dominant_landuse"] = "String";
        model_internal::propertyTypeMap["other_landcover"] = "String";
        model_internal::propertyTypeMap["category"] = "String";
        model_internal::propertyTypeMap["interpreter"] = "int";
        model_internal::propertyTypeMap["image_year"] = "int";
        model_internal::propertyTypeMap["end_otherLandcover"] = "String";
        model_internal::propertyTypeMap["project_id"] = "int";
        model_internal::propertyTypeMap["end_dominantLandcover"] = "String";
        model_internal::propertyTypeMap["other_landuse"] = "String";
        model_internal::propertyTypeMap["landuse_confidence"] = "String";
        model_internal::propertyTypeMap["dominant_landcover_lt50"] = "int";
        model_internal::propertyTypeMap["dominant_landuse_lt50"] = "int";
        model_internal::propertyTypeMap["groups"] = "int";
        model_internal::propertyTypeMap["landcover_confidence"] = "String";

        model_internal::_instance = value;
        model_internal::_end_landcoverValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForEnd_landcover);
        model_internal::_end_landcoverValidator.required = true;
        model_internal::_end_landcoverValidator.requiredFieldError = "end_landcover is required";
        //model_internal::_end_landcoverValidator.source = model_internal::_instance;
        //model_internal::_end_landcoverValidator.property = "end_landcover";
        model_internal::_dominant_landcoverValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDominant_landcover);
        model_internal::_dominant_landcoverValidator.required = true;
        model_internal::_dominant_landcoverValidator.requiredFieldError = "dominant_landcover is required";
        //model_internal::_dominant_landcoverValidator.source = model_internal::_instance;
        //model_internal::_dominant_landcoverValidator.property = "dominant_landcover";
        model_internal::_dominant_landuseValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDominant_landuse);
        model_internal::_dominant_landuseValidator.required = true;
        model_internal::_dominant_landuseValidator.requiredFieldError = "dominant_landuse is required";
        //model_internal::_dominant_landuseValidator.source = model_internal::_instance;
        //model_internal::_dominant_landuseValidator.property = "dominant_landuse";
        model_internal::_other_landcoverValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForOther_landcover);
        model_internal::_other_landcoverValidator.required = true;
        model_internal::_other_landcoverValidator.requiredFieldError = "other_landcover is required";
        //model_internal::_other_landcoverValidator.source = model_internal::_instance;
        //model_internal::_other_landcoverValidator.property = "other_landcover";
        model_internal::_categoryValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForCategory);
        model_internal::_categoryValidator.required = true;
        model_internal::_categoryValidator.requiredFieldError = "category is required";
        //model_internal::_categoryValidator.source = model_internal::_instance;
        //model_internal::_categoryValidator.property = "category";
        model_internal::_end_otherLandcoverValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForEnd_otherLandcover);
        model_internal::_end_otherLandcoverValidator.required = true;
        model_internal::_end_otherLandcoverValidator.requiredFieldError = "end_otherLandcover is required";
        //model_internal::_end_otherLandcoverValidator.source = model_internal::_instance;
        //model_internal::_end_otherLandcoverValidator.property = "end_otherLandcover";
        model_internal::_end_dominantLandcoverValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForEnd_dominantLandcover);
        model_internal::_end_dominantLandcoverValidator.required = true;
        model_internal::_end_dominantLandcoverValidator.requiredFieldError = "end_dominantLandcover is required";
        //model_internal::_end_dominantLandcoverValidator.source = model_internal::_instance;
        //model_internal::_end_dominantLandcoverValidator.property = "end_dominantLandcover";
        model_internal::_other_landuseValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForOther_landuse);
        model_internal::_other_landuseValidator.required = true;
        model_internal::_other_landuseValidator.requiredFieldError = "other_landuse is required";
        //model_internal::_other_landuseValidator.source = model_internal::_instance;
        //model_internal::_other_landuseValidator.property = "other_landuse";
        model_internal::_landuse_confidenceValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLanduse_confidence);
        model_internal::_landuse_confidenceValidator.required = true;
        model_internal::_landuse_confidenceValidator.requiredFieldError = "landuse_confidence is required";
        //model_internal::_landuse_confidenceValidator.source = model_internal::_instance;
        //model_internal::_landuse_confidenceValidator.property = "landuse_confidence";
        model_internal::_landcover_confidenceValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLandcover_confidence);
        model_internal::_landcover_confidenceValidator.required = true;
        model_internal::_landcover_confidenceValidator.requiredFieldError = "landcover_confidence is required";
        //model_internal::_landcover_confidenceValidator.source = model_internal::_instance;
        //model_internal::_landcover_confidenceValidator.property = "landcover_confidence";
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
            throw new Error(propertyName + " is not a data property of entity LuLcEntry");
            
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
            throw new Error(propertyName + " is not a collection property of entity LuLcEntry");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of LuLcEntry");

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
            throw new Error(propertyName + " does not exist for entity LuLcEntry");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity LuLcEntry");
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
            throw new Error(propertyName + " does not exist for entity LuLcEntry");
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
    public function get isEnd_landcoverAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTsaAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDominant_landcoverAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isImage_juldayAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPlotidAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDominant_landuseAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isOther_landcoverAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCategoryAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isInterpreterAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isImage_yearAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isEnd_otherLandcoverAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isProject_idAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isEnd_dominantLandcoverAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isOther_landuseAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isLanduse_confidenceAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDominant_landcover_lt50Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDominant_landuse_lt50Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isGroupsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isLandcover_confidenceAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnEnd_landcover():void
    {
        if (model_internal::_end_landcoverIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfEnd_landcover = null;
            model_internal::calculateEnd_landcoverIsValid();
        }
    }
    public function invalidateDependentOnDominant_landcover():void
    {
        if (model_internal::_dominant_landcoverIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDominant_landcover = null;
            model_internal::calculateDominant_landcoverIsValid();
        }
    }
    public function invalidateDependentOnDominant_landuse():void
    {
        if (model_internal::_dominant_landuseIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDominant_landuse = null;
            model_internal::calculateDominant_landuseIsValid();
        }
    }
    public function invalidateDependentOnOther_landcover():void
    {
        if (model_internal::_other_landcoverIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfOther_landcover = null;
            model_internal::calculateOther_landcoverIsValid();
        }
    }
    public function invalidateDependentOnCategory():void
    {
        if (model_internal::_categoryIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfCategory = null;
            model_internal::calculateCategoryIsValid();
        }
    }
    public function invalidateDependentOnEnd_otherLandcover():void
    {
        if (model_internal::_end_otherLandcoverIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfEnd_otherLandcover = null;
            model_internal::calculateEnd_otherLandcoverIsValid();
        }
    }
    public function invalidateDependentOnEnd_dominantLandcover():void
    {
        if (model_internal::_end_dominantLandcoverIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfEnd_dominantLandcover = null;
            model_internal::calculateEnd_dominantLandcoverIsValid();
        }
    }
    public function invalidateDependentOnOther_landuse():void
    {
        if (model_internal::_other_landuseIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfOther_landuse = null;
            model_internal::calculateOther_landuseIsValid();
        }
    }
    public function invalidateDependentOnLanduse_confidence():void
    {
        if (model_internal::_landuse_confidenceIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLanduse_confidence = null;
            model_internal::calculateLanduse_confidenceIsValid();
        }
    }
    public function invalidateDependentOnLandcover_confidence():void
    {
        if (model_internal::_landcover_confidenceIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLandcover_confidence = null;
            model_internal::calculateLandcover_confidenceIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get end_landcoverStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get end_landcoverValidator() : StyleValidator
    {
        return model_internal::_end_landcoverValidator;
    }

    model_internal function set _end_landcoverIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_end_landcoverIsValid;         
        if (oldValue !== value)
        {
            model_internal::_end_landcoverIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_landcoverIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get end_landcoverIsValid():Boolean
    {
        if (!model_internal::_end_landcoverIsValidCacheInitialized)
        {
            model_internal::calculateEnd_landcoverIsValid();
        }

        return model_internal::_end_landcoverIsValid;
    }

    model_internal function calculateEnd_landcoverIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_end_landcoverValidator.validate(model_internal::_instance.end_landcover)
        model_internal::_end_landcoverIsValid_der = (valRes.results == null);
        model_internal::_end_landcoverIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::end_landcoverValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::end_landcoverValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get end_landcoverValidationFailureMessages():Array
    {
        if (model_internal::_end_landcoverValidationFailureMessages == null)
            model_internal::calculateEnd_landcoverIsValid();

        return _end_landcoverValidationFailureMessages;
    }

    model_internal function set end_landcoverValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_end_landcoverValidationFailureMessages;

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
            model_internal::_end_landcoverValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_landcoverValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get tsaStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get dominant_landcoverStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get dominant_landcoverValidator() : StyleValidator
    {
        return model_internal::_dominant_landcoverValidator;
    }

    model_internal function set _dominant_landcoverIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_dominant_landcoverIsValid;         
        if (oldValue !== value)
        {
            model_internal::_dominant_landcoverIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landcoverIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landcoverIsValid():Boolean
    {
        if (!model_internal::_dominant_landcoverIsValidCacheInitialized)
        {
            model_internal::calculateDominant_landcoverIsValid();
        }

        return model_internal::_dominant_landcoverIsValid;
    }

    model_internal function calculateDominant_landcoverIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_dominant_landcoverValidator.validate(model_internal::_instance.dominant_landcover)
        model_internal::_dominant_landcoverIsValid_der = (valRes.results == null);
        model_internal::_dominant_landcoverIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::dominant_landcoverValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::dominant_landcoverValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landcoverValidationFailureMessages():Array
    {
        if (model_internal::_dominant_landcoverValidationFailureMessages == null)
            model_internal::calculateDominant_landcoverIsValid();

        return _dominant_landcoverValidationFailureMessages;
    }

    model_internal function set dominant_landcoverValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_dominant_landcoverValidationFailureMessages;

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
            model_internal::_dominant_landcoverValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landcoverValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get image_juldayStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get plotidStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get dominant_landuseStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get dominant_landuseValidator() : StyleValidator
    {
        return model_internal::_dominant_landuseValidator;
    }

    model_internal function set _dominant_landuseIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_dominant_landuseIsValid;         
        if (oldValue !== value)
        {
            model_internal::_dominant_landuseIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landuseIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landuseIsValid():Boolean
    {
        if (!model_internal::_dominant_landuseIsValidCacheInitialized)
        {
            model_internal::calculateDominant_landuseIsValid();
        }

        return model_internal::_dominant_landuseIsValid;
    }

    model_internal function calculateDominant_landuseIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_dominant_landuseValidator.validate(model_internal::_instance.dominant_landuse)
        model_internal::_dominant_landuseIsValid_der = (valRes.results == null);
        model_internal::_dominant_landuseIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::dominant_landuseValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::dominant_landuseValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landuseValidationFailureMessages():Array
    {
        if (model_internal::_dominant_landuseValidationFailureMessages == null)
            model_internal::calculateDominant_landuseIsValid();

        return _dominant_landuseValidationFailureMessages;
    }

    model_internal function set dominant_landuseValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_dominant_landuseValidationFailureMessages;

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
            model_internal::_dominant_landuseValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landuseValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get other_landcoverStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get other_landcoverValidator() : StyleValidator
    {
        return model_internal::_other_landcoverValidator;
    }

    model_internal function set _other_landcoverIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_other_landcoverIsValid;         
        if (oldValue !== value)
        {
            model_internal::_other_landcoverIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landcoverIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get other_landcoverIsValid():Boolean
    {
        if (!model_internal::_other_landcoverIsValidCacheInitialized)
        {
            model_internal::calculateOther_landcoverIsValid();
        }

        return model_internal::_other_landcoverIsValid;
    }

    model_internal function calculateOther_landcoverIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_other_landcoverValidator.validate(model_internal::_instance.other_landcover)
        model_internal::_other_landcoverIsValid_der = (valRes.results == null);
        model_internal::_other_landcoverIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::other_landcoverValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::other_landcoverValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get other_landcoverValidationFailureMessages():Array
    {
        if (model_internal::_other_landcoverValidationFailureMessages == null)
            model_internal::calculateOther_landcoverIsValid();

        return _other_landcoverValidationFailureMessages;
    }

    model_internal function set other_landcoverValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_other_landcoverValidationFailureMessages;

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
            model_internal::_other_landcoverValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landcoverValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get categoryStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get categoryValidator() : StyleValidator
    {
        return model_internal::_categoryValidator;
    }

    model_internal function set _categoryIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_categoryIsValid;         
        if (oldValue !== value)
        {
            model_internal::_categoryIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "categoryIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get categoryIsValid():Boolean
    {
        if (!model_internal::_categoryIsValidCacheInitialized)
        {
            model_internal::calculateCategoryIsValid();
        }

        return model_internal::_categoryIsValid;
    }

    model_internal function calculateCategoryIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_categoryValidator.validate(model_internal::_instance.category)
        model_internal::_categoryIsValid_der = (valRes.results == null);
        model_internal::_categoryIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::categoryValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::categoryValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get categoryValidationFailureMessages():Array
    {
        if (model_internal::_categoryValidationFailureMessages == null)
            model_internal::calculateCategoryIsValid();

        return _categoryValidationFailureMessages;
    }

    model_internal function set categoryValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_categoryValidationFailureMessages;

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
            model_internal::_categoryValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "categoryValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get interpreterStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get image_yearStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get end_otherLandcoverStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get end_otherLandcoverValidator() : StyleValidator
    {
        return model_internal::_end_otherLandcoverValidator;
    }

    model_internal function set _end_otherLandcoverIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_end_otherLandcoverIsValid;         
        if (oldValue !== value)
        {
            model_internal::_end_otherLandcoverIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_otherLandcoverIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get end_otherLandcoverIsValid():Boolean
    {
        if (!model_internal::_end_otherLandcoverIsValidCacheInitialized)
        {
            model_internal::calculateEnd_otherLandcoverIsValid();
        }

        return model_internal::_end_otherLandcoverIsValid;
    }

    model_internal function calculateEnd_otherLandcoverIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_end_otherLandcoverValidator.validate(model_internal::_instance.end_otherLandcover)
        model_internal::_end_otherLandcoverIsValid_der = (valRes.results == null);
        model_internal::_end_otherLandcoverIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::end_otherLandcoverValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::end_otherLandcoverValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get end_otherLandcoverValidationFailureMessages():Array
    {
        if (model_internal::_end_otherLandcoverValidationFailureMessages == null)
            model_internal::calculateEnd_otherLandcoverIsValid();

        return _end_otherLandcoverValidationFailureMessages;
    }

    model_internal function set end_otherLandcoverValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_end_otherLandcoverValidationFailureMessages;

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
            model_internal::_end_otherLandcoverValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_otherLandcoverValidationFailureMessages", oldValue, value));
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
    public function get end_dominantLandcoverStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get end_dominantLandcoverValidator() : StyleValidator
    {
        return model_internal::_end_dominantLandcoverValidator;
    }

    model_internal function set _end_dominantLandcoverIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_end_dominantLandcoverIsValid;         
        if (oldValue !== value)
        {
            model_internal::_end_dominantLandcoverIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_dominantLandcoverIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get end_dominantLandcoverIsValid():Boolean
    {
        if (!model_internal::_end_dominantLandcoverIsValidCacheInitialized)
        {
            model_internal::calculateEnd_dominantLandcoverIsValid();
        }

        return model_internal::_end_dominantLandcoverIsValid;
    }

    model_internal function calculateEnd_dominantLandcoverIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_end_dominantLandcoverValidator.validate(model_internal::_instance.end_dominantLandcover)
        model_internal::_end_dominantLandcoverIsValid_der = (valRes.results == null);
        model_internal::_end_dominantLandcoverIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::end_dominantLandcoverValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::end_dominantLandcoverValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get end_dominantLandcoverValidationFailureMessages():Array
    {
        if (model_internal::_end_dominantLandcoverValidationFailureMessages == null)
            model_internal::calculateEnd_dominantLandcoverIsValid();

        return _end_dominantLandcoverValidationFailureMessages;
    }

    model_internal function set end_dominantLandcoverValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_end_dominantLandcoverValidationFailureMessages;

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
            model_internal::_end_dominantLandcoverValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_dominantLandcoverValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get other_landuseStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get other_landuseValidator() : StyleValidator
    {
        return model_internal::_other_landuseValidator;
    }

    model_internal function set _other_landuseIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_other_landuseIsValid;         
        if (oldValue !== value)
        {
            model_internal::_other_landuseIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landuseIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get other_landuseIsValid():Boolean
    {
        if (!model_internal::_other_landuseIsValidCacheInitialized)
        {
            model_internal::calculateOther_landuseIsValid();
        }

        return model_internal::_other_landuseIsValid;
    }

    model_internal function calculateOther_landuseIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_other_landuseValidator.validate(model_internal::_instance.other_landuse)
        model_internal::_other_landuseIsValid_der = (valRes.results == null);
        model_internal::_other_landuseIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::other_landuseValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::other_landuseValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get other_landuseValidationFailureMessages():Array
    {
        if (model_internal::_other_landuseValidationFailureMessages == null)
            model_internal::calculateOther_landuseIsValid();

        return _other_landuseValidationFailureMessages;
    }

    model_internal function set other_landuseValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_other_landuseValidationFailureMessages;

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
            model_internal::_other_landuseValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landuseValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get landuse_confidenceStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get landuse_confidenceValidator() : StyleValidator
    {
        return model_internal::_landuse_confidenceValidator;
    }

    model_internal function set _landuse_confidenceIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_landuse_confidenceIsValid;         
        if (oldValue !== value)
        {
            model_internal::_landuse_confidenceIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landuse_confidenceIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get landuse_confidenceIsValid():Boolean
    {
        if (!model_internal::_landuse_confidenceIsValidCacheInitialized)
        {
            model_internal::calculateLanduse_confidenceIsValid();
        }

        return model_internal::_landuse_confidenceIsValid;
    }

    model_internal function calculateLanduse_confidenceIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_landuse_confidenceValidator.validate(model_internal::_instance.landuse_confidence)
        model_internal::_landuse_confidenceIsValid_der = (valRes.results == null);
        model_internal::_landuse_confidenceIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::landuse_confidenceValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::landuse_confidenceValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get landuse_confidenceValidationFailureMessages():Array
    {
        if (model_internal::_landuse_confidenceValidationFailureMessages == null)
            model_internal::calculateLanduse_confidenceIsValid();

        return _landuse_confidenceValidationFailureMessages;
    }

    model_internal function set landuse_confidenceValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_landuse_confidenceValidationFailureMessages;

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
            model_internal::_landuse_confidenceValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landuse_confidenceValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get dominant_landcover_lt50Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get dominant_landuse_lt50Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get groupsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get landcover_confidenceStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get landcover_confidenceValidator() : StyleValidator
    {
        return model_internal::_landcover_confidenceValidator;
    }

    model_internal function set _landcover_confidenceIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_landcover_confidenceIsValid;         
        if (oldValue !== value)
        {
            model_internal::_landcover_confidenceIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landcover_confidenceIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get landcover_confidenceIsValid():Boolean
    {
        if (!model_internal::_landcover_confidenceIsValidCacheInitialized)
        {
            model_internal::calculateLandcover_confidenceIsValid();
        }

        return model_internal::_landcover_confidenceIsValid;
    }

    model_internal function calculateLandcover_confidenceIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_landcover_confidenceValidator.validate(model_internal::_instance.landcover_confidence)
        model_internal::_landcover_confidenceIsValid_der = (valRes.results == null);
        model_internal::_landcover_confidenceIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::landcover_confidenceValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::landcover_confidenceValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get landcover_confidenceValidationFailureMessages():Array
    {
        if (model_internal::_landcover_confidenceValidationFailureMessages == null)
            model_internal::calculateLandcover_confidenceIsValid();

        return _landcover_confidenceValidationFailureMessages;
    }

    model_internal function set landcover_confidenceValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_landcover_confidenceValidationFailureMessages;

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
            model_internal::_landcover_confidenceValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landcover_confidenceValidationFailureMessages", oldValue, value));
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
            case("end_landcover"):
            {
                return end_landcoverValidationFailureMessages;
            }
            case("dominant_landcover"):
            {
                return dominant_landcoverValidationFailureMessages;
            }
            case("dominant_landuse"):
            {
                return dominant_landuseValidationFailureMessages;
            }
            case("other_landcover"):
            {
                return other_landcoverValidationFailureMessages;
            }
            case("category"):
            {
                return categoryValidationFailureMessages;
            }
            case("end_otherLandcover"):
            {
                return end_otherLandcoverValidationFailureMessages;
            }
            case("end_dominantLandcover"):
            {
                return end_dominantLandcoverValidationFailureMessages;
            }
            case("other_landuse"):
            {
                return other_landuseValidationFailureMessages;
            }
            case("landuse_confidence"):
            {
                return landuse_confidenceValidationFailureMessages;
            }
            case("landcover_confidence"):
            {
                return landcover_confidenceValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
