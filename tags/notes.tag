<notes>
	<h3>Notes</h3>
	<ul>
		<li each="{val, key in filter(notes)}">
			{val.content}
		</li>
	</ul>
	<form onsubmit={add}>
		<input type="text" ref="content" onkeyup={edit} placeholder="Add notes">
		<select ref="category">
			<option each="{val, key in categories}" value="{val.id}">{val.name}</option>
		</select>
		<button type="button" disabled={!content} onclick={add}>Add note</button>
	</form>
<script>
	this.mixin("localStorageMixin");
	this.notes = this.getItem(NOTES_KEY);
	this.categories = this.getItem(CATEGORY_KEY);

	this.content = "";
	edit(e){
		this.content = e.target.value;
	}

	this.selectedCategory = 0;

	filter(notes){
		return notes.filter((val) => {
			if(val.category == this.selectedCategory || this.selectedCategory == 0){
				return true;
			}
		})
	}

	add(e){
		if(this.refs.content.value){
			var note = {
				category: this.refs.category.value || 0,
				content: this.refs.content.value
			}
			this.content = this.refs.content.value = "";
			this.notes.push(note);
			this.setItem(NOTES_KEY, this.notes);
		}
		e.preventDefault();
	}

	this.opts.observable.on("add_category", (data) => {
		this.categories.push(data);
		this.update();
	})

	this.opts.observable.on("change_category", (data) => {
		this.selectedCategory = data;
		this.update();
	})
</script>
</notes>