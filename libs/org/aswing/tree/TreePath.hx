/*
 Copyright aswing.org, see the LICENCE.txt.
*/

package org.aswing.tree;
import flash.errors.Error;
 

/**
 * TODO make TreePash faster as hashmap key
 * @author paling
 */
class TreePath{
	 /** 
	  * Path representing the parent, null if lastPathComponent represents
      * the root. 
      */
    private var parentPath:TreePath;
    /** Last path component. */
    private var lastPathComponent:Dynamic;
    
    /**
     * Constructs a path from an array of Objects, uniquely identifying 
     * the path from the root of the tree to a specific node, as returned
     * by the tree's data model.
     * <p>
     * The model is free to return an array of any Objects it needs to 
     * represent the path. The DefaultTreeModel returns an array of 
     * TreeNode objects. The first TreeNode in the path is the root of the
     * tree, the last TreeNode is the node identified by the path.
     * </p>
     * @param path  an array of Objects representing the path to a node
     */
    public function new(path:Array<Dynamic>) {
        if(path == null || path.length == 0){
        	trace("Error : path in TreePath must be non null and not empty.");
            throw new Error("path in TreePath must be non null and not empty.");
			 
        }
		lastPathComponent = path[path.length - 1];
		if(path.length > 1){
			var pp:Array<Dynamic>= path.copy();
			pp.pop();
		    parentPath = new TreePath(pp);
	    }
    }
    
    /**
     * Constructs a new TreePath, which is the path identified by
     * <code>parent</code> ending in <code>lastElement</code>.
     */
    public static function createTreePath(parent:TreePath, lastElement:Dynamic):TreePath {
		if(lastElement == null){
			trace("path in TreePath must be non null.");
			throw new Error("path in TreePath must be non null.");
		}
		var tp:TreePath = new TreePath([null]);
		tp.parentPath = parent;
		tp.lastPathComponent = lastElement;
		return tp;
    }

    /**
     * Returns an ordered array of Objects containing the components of this
     * TreePath. The first element (index 0) is the root.
     *
     * @return an array of Objects representing the TreePath
     * @see #TreePath(*[])
     */
    public function getPath():Array<Dynamic>{
		var i:Int= getPathCount();
        var result:Array<Dynamic>= new Array<Dynamic>();
        i--;
		//  for(var path:TreePath = this; path != null; path = path.parentPath) {
		var path:TreePath = this;
        while(path != null){
            result[i] = path.lastPathComponent;
            i--;
			path = path.parentPath;
        }
		return result;
    }

    /**
     * Returns the last component of this path. For a path returned by
     * DefaultTreeModel this will return an instance of TreeNode.
     *
     * @return the Object at the end of the path
     * @see #TreePath(*[])
     */
    public function getLastPathComponent():Dynamic{
		return lastPathComponent;
    }

    /**
     * Returns the number of elements in the path.
     *
     * @return an int giving a count of items the path
     */
    public function getPathCount():Int{
        var result:Int = 0;
		var path:TreePath = this;
        while(path != null){            
            result++;
			path = path.parentPath;        
        }
		return result;
    }

    /**
     * Returns the path component at the specified index.
     *
     * @param element  an int specifying an element in the path, where
     *                 0 is the first element in the path
     * @return the Object at that index location, undefined if the index is beyond the length of the path
     *         
     * @see #TreePath(Object[])
     */
    public function getPathComponent(element:Int):Dynamic{
        var pathLength:Int= getPathCount();

        if(element < 0 || element >= pathLength){
            return null;
        }

        var path:TreePath = this;

        for(i in element...pathLength){
           path = path.parentPath;
        }
		return path.lastPathComponent;
    }

    /**
     * Tests two TreePaths for equality by checking each element of the
     * paths for equality. Two paths are considered equal if they are of
     * the same length, and contain
     * the same elements (<code>.equals</code>).
     *
     * @param o the Object to compare
     */
    public function equals(o:Dynamic):Bool{
		if(o == this){
		    return true;
		}
        if(Std.is(o,TreePath)) {
            var oTreePath:TreePath = flash.Lib.as(o,TreePath);
	    	if(getPathCount() != oTreePath.getPathCount()){
				return false;
	    	}
			var path:TreePath = this;
			while(path != null){            
				if (path.lastPathComponent != oTreePath.lastPathComponent) {
						return false;
					}
					oTreePath = oTreePath.parentPath;
				path = path.parentPath;        
			}
	     
	    	return true;
        }
        return false;
    }


    /**
     * Returns true if <code>aTreePath</code> is a
     * descendant of this
     * TreePath. A TreePath P1 is a descendent of a TreePath P2
     * if P1 contains all of the components that make up 
     * P2's path.
     * For example, if this object has the path [a, b],
     * and <code>aTreePath</code> has the path [a, b, c], 
     * then <code>aTreePath</code> is a descendant of this object.
     * However, if <code>aTreePath</code> has the path [a],
     * then it is not a descendant of this object.
     *
     * @return true if <code>aTreePath</code> is a descendant of this path
     */
    public function isDescendant(aTreePath:TreePath):Bool{
		if(aTreePath == this)
	    	return true;

        if(aTreePath != null) {
            var pathLength:Float= getPathCount();
	    	var oPathLength:Float= aTreePath.getPathCount();

	    	if(oPathLength < pathLength){
				// Can't be a descendant, has fewer components in the path.
				return false;
	    	}
			while(oPathLength > pathLength){
				aTreePath = aTreePath.getParentPath();
				oPathLength--;
			}
			return equals(aTreePath);
        }
        return false;
    }

    /**
     * Returns a new path containing all the elements of this object
     * plus <code>child</code>. <code>child</code> will be the last element
     * of the newly created TreePath.
     * This will throw a NullPointerException
     * if child is null.
     */
    public function pathByAddingChild(child:Dynamic):TreePath {
		if(child == null){
			trace("Null child not allowed");
	    	throw new Error("Null child not allowed");
		}

		return createTreePath(this, child);
    }

    /**
     * Returns a path containing all the elements of this object, except
     * the last path component.
     */
    public function getParentPath():TreePath {
		return parentPath;
    }
    
    /**
     * Returns a string that displays and identifies this
     * object's properties.
     *
     * @return a String representation of this object
     */
    public function toString():String{
        return "TreePath[" + getPath() + "]";
    }    

}