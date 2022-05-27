<template>
  <ul class="row category-list">
    <li
      class="col-md-3 mb-1"
      v-for="(categories, key, groupIndex) in groups"
      :key="groupIndex"
    >
      <p class="col-md-12 mb-0 text-left">
        <small>
          <strong>
            <span>
              {{key}}
            </span>
          </strong>
        </small>
      </p>
      <ul class="row category-list">
        <li
          class="col-md-12 text-left"
          v-for="category in categories"
          :key="category.category_id"
        >
          <router-link
            class="text-dark cursor-pointer"
            :to="'/category/' + category.category_id"
          >
            <small class="cursor-pointer">
              <label class="cursor-pointer" role="button">{{ category.category_name }}
                <span class="badge badge-pill badge-success">
                  {{category.post_count}}
                </span>
              </label>
            </small>
          </router-link>
        </li>
      </ul>
    </li>
  </ul>
</template>

<script>
export default {
  name: "category-list",
  props: {
    categories: {
      type: Array,
    },
  },
  computed: {
    groups() {
      let categories = this.categories.reduce((r, a) => {
        let key = a.category_name.charAt(0);
        r[key] = [...(r[key] || []), a];
        return r;
      }, {});
      return categories;
    },
  },
};
</script>

<style lang="scss" scoped>
.category-list {
  width: 100%;
  list-style: none;
  padding: 0px;
  margin: 0px;
}
</style>