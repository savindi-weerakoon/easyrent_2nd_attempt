<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-2">
        <div class="row">
          <div class="col-md-12 ml-3">
            <div class="mt-4 mb-4">
              <h5>Apply Filters</h5>
            </div>
            <div class="form-group mb-3">
              <label for="exampleInputEmail1">Search keyword</label>
              <input
                type="text"
                class="form-control"
                placeholder="Search item name"
                v-model="filters.searchKeyword"
                @keyup.enter="applyFilters"
              />
            </div>
            <div class="form-group mb-3 mt-4">
              <label>Price Range</label>
              <div class="row">
                <div class="col-md-6">
                  <input
                    type="number"
                    class="form-control"
                    id="Number"
                    name="Number"
                    min="1"
                    max="100"
                    placeholder="min"
                    v-model="filters.min"
                  />
                </div>
                <div class="col-md-6">
                  <input
                    type="number"
                    class="form-control"
                    id="Number"
                    name="Number"
                    min="1"
                    max="100"
                    placeholder="max"
                    v-model="filters.max"
                  />
                </div>
              </div>
            </div>
            <div class="form-group">
              <star-rating
                :star-size="24"
                v-model:rating="rating"
              ></star-rating>
            </div>
            <div class="form-group">
              <label>Categories</label>
              <ul class="category-filter p-0">
                <li v-for="category in categories" :key="category.category_id">
                  <!-- {{category}} -->
                  <div class="custom-control custom-radio">
                    <input
                      type="radio"
                      v-model="filters.categoryId"
                      :value="category.category_id"
                      :id="'category' + category.category_id"
                      name="categories"
                      class="custom-control-input"
                    />
                    <label
                      class="custom-control-label"
                      :for="'category' + category.category_id"
                      ><small>{{ category.category_name }}</small></label
                    >
                  </div>
                </li>
              </ul>
            </div>
            <button class="btn btn-dark mt-3 col-md-12" @click="resetFields">Clear Filter</button>
            <br />
            <button class="btn btn-success mt-4 col-md-12" @click="applyFilters">Apply Filter</button>
          </div>
        </div>
      </div>
      <div class="ml-4">
        <Post />
        {{ filters.categoryId }}
        {{ filters.min_price }}
        {{ filters.max_price }}
        {{  rating }}
        {{ filters.searchKeyword }}
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import StarRating from "vue-star-rating";
import Post from "@/components/common/Post.vue";
export default {
  name: "ViewPosts",
  data() {
    return {
      isMenu: false,
      filters: {
        categoryId: '',
        min: 2,
        max: 300,
        // rating: 5,
        searchKeyword: "",
      },
      categories:[],
      rating: null,
    };
  },
  components: {
    Post,
    StarRating,
  },
  methods: {
    getCategoriesView() {
      let url = '/apinew/getCategoriesView/'
      axios({
        method: "get",
        url: url,
      })
      .then((response) => {
        if (response.status === 200) {
          this.categories = response.data.categories;
        }
      })
      .catch(error => {
        console.error(error)
      })
    },
    resetFields() {
      this.filters.categoryId= null;
      this.filters.min=null;
      this.filters.max=null;
      this.rating = null;
      this.filters.searchKeyword=null;
    },
    filterPosts() {
      let url = "/apinew/getPostsByCategoryFiltered/";
      var form = new FormData();
      form.append("category_id", this.filters.categoryId);
      form.append("min", this.filters.min);
      form.append("max", this.filters.min);
      form.append("rating", this.rating);
      form.append("keyword", this.filters.searchKeyword);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    applyFilters() {
      this.filterPosts();
    },
  },
  mounted() {
    this.filterPosts();
    this.getCategoriesView();
  },
};
</script>
<style lang="scss" scoped>
.round-bar {
  height: 18px !important;
  padding: 0px 8px !important;
  /deep/.round-bar-track {
    margin: 5px auto !important;
  }
}
.category-filter {
  list-style: none;
}
</style>
