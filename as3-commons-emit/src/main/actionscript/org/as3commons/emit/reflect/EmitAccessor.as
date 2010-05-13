/*
 * Copyright (c) 2007-2009-2010 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package org.as3commons.emit.reflect {
	import org.as3commons.emit.bytecode.QualifiedName;
	import org.as3commons.reflect.Accessor;
	import org.as3commons.reflect.AccessorAccess;
	import org.as3commons.reflect.Type;
	import org.as3commons.reflect.as3commons_reflect;

	public class EmitAccessor extends Accessor implements IEmitMember, IEmitProperty {

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------

		/**
		 * Constructor.
		 */
		public function EmitAccessor(declaringType:EmitType, name:String, fullName:String, access:AccessorAccess, type:EmitType, visibility:uint, isStatic:Boolean, isOverride:Boolean, metaData:Array = null, ns:String = null) {
			super(name, access, type.name, declaringType.name, isStatic, metaData);

			_visibility = visibility;
			_isOverride = isOverride;
			as3commons_reflect::setDeclaringType(declaringType);
			as3commons_reflect::setType(type);
			as3commons_reflect::setNamespaceURI(ns || "");
			_qname = EmitReflectionUtils.getMemberQualifiedName(this);
			_fullName = (fullName || EmitReflectionUtils.getMemberFullName(declaringType, name));
		}

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------

		//----------------------------------
		//  declaringType
		//----------------------------------

		public function set declaringType(value:Type):void {
			as3commons_reflect::setDeclaringType(value);
		}

		//----------------------------------
		//  fullName
		//----------------------------------

		private var _fullName:String;

		public function get fullName():String {
			return _fullName;
		}

		public function set fullName(value:String):void {
			_fullName = value;
		}

		//----------------------------------
		//  getMethod
		//----------------------------------

		private var _getMethod:EmitMethod;

		public function get getMethod():EmitMethod {
			if (_getMethod == null) {
				_getMethod = new EmitMethod(declaringType as EmitType, "get", fullName + "/get", visibility, isStatic, isOverride, [], type);
			}
			return _getMethod;
		}

		public function set getMethod(value:EmitMethod):void {
			_getMethod = value;
		}

		//----------------------------------
		//  isOverride
		//----------------------------------

		private var _isOverride:Boolean = false;

		public function get isOverride():Boolean {
			return _isOverride;
		}

		public function set isOverride(value:Boolean):void {
			_isOverride = value;
		}

		//----------------------------------
		//  isStatic
		//----------------------------------

		public function set isStatic(value:Boolean):void {
			as3commons_reflect::setIsStatic(value);
		}

		//----------------------------------
		//  name
		//----------------------------------

		public function set name(value:String):void {
			as3commons_reflect::setName(value);
		}

		//----------------------------------
		//  namespaceURI
		//----------------------------------

		public function set namespaceURI(value:String):void {
			as3commons_reflect::setNamespaceURI(value);
		}

		//----------------------------------
		//  setMethod
		//----------------------------------

		private var _setMethod:EmitMethod;

		public function get setMethod():EmitMethod {
			if (_setMethod == null) {
				_setMethod = new EmitMethod(declaringType as EmitType, "set", fullName + "/set", visibility, isStatic, isOverride, [new EmitParameter("value", 0, EmitType(type), false)], EmitTypeUtils.VOID);
			}
			return _setMethod;
		}

		public function set setMethod(value:EmitMethod):void {
			_setMethod = value;
		}

		//----------------------------------
		//  type
		//----------------------------------

		public function set type(value:Type):void {
			as3commons_reflect::setType(value);
		}

		//----------------------------------
		//  visibility
		//----------------------------------

		private var _visibility:uint;

		public function get visibility():uint {
			return _visibility;
		}

		public function set visibility(value:uint):void {
			_visibility = value;
		}

		//----------------------------------
		//  qname
		//----------------------------------

		private var _qname:QualifiedName;

		public function get qname():QualifiedName {
			return _qname;
		}

		public function set qname(value:QualifiedName):void {
			_qname = value;
		}
	}
}