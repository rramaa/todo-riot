//GLOBALS
var NOTES_KEY = "notes";
var CATEGORY_KEY = "category";
riot.mixin("localStorageMixin", {
	getItem: function(key){
		var item = localStorage.getItem(key);
		try {
			item = JSON.parse(item);
		} catch(e){
			item = null;
		}
		return item;
	},
	setItem: function(key, item){
		localStorage.setItem(key, JSON.stringify(item));
	}
})

riot.mount("app");