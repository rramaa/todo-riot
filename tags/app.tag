<app>
<script>
	this.mixin("localStorageMixin");
	if(!this.getItem(NOTES_KEY)){
			this.setItem(NOTES_KEY, []);
	}
	if(!this.getItem(CATEGORY_KEY)){
		this.setItem(CATEGORY_KEY, [{id: 0, name: "Uncategorized"}]);
	}
	var observable = riot.observable()
	riot.mount("category", {
		observable: observable
	});
	riot.mount("notes", {
		observable: observable
	});
</script>
</app>