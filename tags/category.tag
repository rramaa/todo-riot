<category>
	<h3>Categories</h3>
	<ul>
		<li each="{val, key in categories}">
			<span onclick={selectCategory} data-id="{val.id}" style="cursor: pointer;">{val.name}</span>
		</li>
	</ul>
	<form onsubmit={add}>
		<input type="text" ref="name" onkeyup={edit} placeholder="Add category">
		<button type="button" disabled={!name} onclick={add}>Add category</button>
	</form>
	<script>
		this.mixin("localStorageMixin");
		this.categories = this.getItem(CATEGORY_KEY);

		this.name = "";
		edit(e){
			this.name = e.target.value;
		}

		add(e){
			if(this.refs.name.value){
				var category = {
					id: this.categories.length,
					name: this.refs.name.value
				}
				this.name = this.refs.name.value = "";
				this.categories.push(category);
				this.opts.observable.trigger("add_category", category);
				this.setItem(CATEGORY_KEY, this.categories);
			}
			e.preventDefault();
		}

		selectCategory(e){
			this.opts.observable.trigger("change_category", e.item.val.id);
		}

	</script>
</category>