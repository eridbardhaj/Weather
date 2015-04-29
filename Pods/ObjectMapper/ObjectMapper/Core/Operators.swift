//
//  Operators.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-09.
//  Copyright (c) 2014 hearst. All rights reserved.
//

/**
* This file defines a new operator which is used to create a mapping between an object and a JSON key value.
* There is an overloaded operator definition for each type of object that is supported in ObjectMapper.
* This provides a way to add custom logic to handle specific types of objects
*/

infix operator <- {}

// MARK:- Objects with Basic types
/**
* Object of Basic type
*/

public func <- <T>(inout left: T, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.basicType(&left, object: right.value())
    } else {
        ToJSON.basicType(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Optional object of basic type
*/
public func <- <T>(inout left: T?, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.optionalBasicType(&left, object: right.value())
    } else {
        ToJSON.optionalBasicType(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Implicitly unwrapped optional object of basic type
*/
public func <- <T>(inout left: T!, right: Map) {
	if right.mappingType == MappingType.FromJSON {
		FromJSON.optionalBasicType(&left, object: right.value())
	} else {
		ToJSON.optionalBasicType(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/**
* Object of Basic type with Transform
*/
public func <- <T, Transform: TransformType where Transform.Object == T>(inout left: T, right: (Map, Transform)) {
    if right.0.mappingType == MappingType.FromJSON {
        var value: T? = right.1.transformFromJSON(right.0.currentValue)
        FromJSON.basicType(&left, object: value)
    } else {
        var value: Transform.JSON? = right.1.transformToJSON(left)
        ToJSON.optionalBasicType(value, key: right.0.currentKey!, dictionary: &right.0.JSONDictionary)
    }
}

/**
* Optional object of basic type with Transform
*/
public func <- <T, Transform: TransformType where Transform.Object == T>(inout left: T?, right: (Map, Transform)) {
    if right.0.mappingType == MappingType.FromJSON {
        var value: T? = right.1.transformFromJSON(right.0.currentValue)
        FromJSON.optionalBasicType(&left, object: value)
    } else {
        var value: Transform.JSON? = right.1.transformToJSON(left)
        ToJSON.optionalBasicType(value, key: right.0.currentKey!, dictionary: &right.0.JSONDictionary)
    }
}

/**
* Implicitly unwrapped optional object of basic type with Transform
*/
public func <- <T, Transform: TransformType where Transform.Object == T>(inout left: T!, right: (Map, Transform)) {
	if right.0.mappingType == MappingType.FromJSON {
		var value: T? = right.1.transformFromJSON(right.0.currentValue)
		FromJSON.optionalBasicType(&left, object: value)
	} else {
		var value: Transform.JSON? = right.1.transformToJSON(left)
		ToJSON.optionalBasicType(value, key: right.0.currentKey!, dictionary: &right.0.JSONDictionary)
	}
}

// MARK:- Mappable Objects - <T: Mappable>
/**
* Object conforming to Mappable
*/
public func <- <T: Mappable>(inout left: T, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.object(&left, object: right.currentValue)
    } else {
        ToJSON.object(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Optional Mappable objects
*/
public func <- <T: Mappable>(inout left: T?, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.optionalObject(&left, object: right.currentValue)
    } else {
        ToJSON.optionalObject(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Implicitly unwrapped optional Mappable objects
*/
public func <- <T: Mappable>(inout left: T!, right: Map) {
	if right.mappingType == MappingType.FromJSON {
		FromJSON.optionalObject(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObject(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

// MARK:- Dictionary of Mappable objects - Dictionary<String, T: Mappable>
/**
* Dictionary of Mappable objects <String, T: Mappable>
*/
public func <- <T: Mappable>(inout left: Dictionary<String, T>, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.objectDictionary(&left, object: right.currentValue)
    } else {
        ToJSON.objectDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Optional Dictionary of Mappable object <String, T: Mappable>
*/
public func <- <T: Mappable>(inout left: Dictionary<String, T>?, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.optionalObjectDictionary(&left, object: right.currentValue)
    } else {
        ToJSON.optionalObjectDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable>
*/
public func <- <T: Mappable>(inout left: Dictionary<String, T>!, right: Map) {
	if right.mappingType == MappingType.FromJSON {
		FromJSON.optionalObjectDictionary(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

// MARK:- Array of Mappable objects - Array<T: Mappable>
/**
* Array of Mappable objects
*/
public func <- <T: Mappable>(inout left: Array<T>, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.objectArray(&left, object: right.currentValue)
    } else {
        ToJSON.objectArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Optional array of Mappable objects
*/
public func <- <T: Mappable>(inout left: Array<T>?, right: Map) {
    if right.mappingType == MappingType.FromJSON {
        FromJSON.optionalObjectArray(&left, object: right.currentValue)
    } else {
        ToJSON.optionalObjectArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Implicitly unwrapped Optional array of Mappable objects
*/
public func <- <T: Mappable>(inout left: Array<T>!, right: Map) {
	if right.mappingType == MappingType.FromJSON {
		FromJSON.optionalObjectArray(&left, object: right.currentValue)
	} else {
		ToJSON.optionalObjectArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}