## 0.2.1 
The Table component supports a list of keys in the `sorted_by` prop, which will fetch try to automatically fetch the nested data based on the keys. Datatypes that are supported are: Map and List. If the key is a string or atom, then `Map.get/2` will be used, otherwise `Enum.at`. 

Fixed a bug that prevented the Table component from updating when the `data` prop was changed. 
