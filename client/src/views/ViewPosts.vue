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
                v-model="searchKeyword"
                @keyup.enter="applyFilters"
              />
            </div>
            <div class="form-group mb-3 mt-4">
              <label>Price Range</label>
              <p>Rs. 12000 - Rs. 18000</p>
            </div>
            <range-slider
              v-if="filters"
              :ballWidth="16"
              :barHeight="8"
              :min="min_price"
              :max="max_price"
              :step="100"
              :start="filters.price_range.start"
              :end="filters.price_range.end"
              @slideEnd="slideEnd"
              :key="rangeCount"
            >
            </range-slider>
            <div class="form-group">
              <label>Categories</label>
              <div class="form-check">
                <input
                  class="form-check-input"
                  type="radio"
                  name="flexRadioDefault"
                  id="flexRadioDefault1"
                />
                <label class="form-check-label" for="flexRadioDefault1">
                  <small>Party Items</small>
                </label>
              </div>
              <div class="form-check">
                <input
                  class="form-check-input"
                  type="radio"
                  name="flexRadioDefault"
                  id="flexRadioDefault1"
                />
                <label class="form-check-label" for="flexRadioDefault1">
                  <small>Technical Equipments</small>
                </label>
              </div>
              <div class="form-check">
                <input
                  class="form-check-input"
                  type="radio"
                  name="flexRadioDefault"
                  id="flexRadioDefault1"
                />
                <label class="form-check-label" for="flexRadioDefault1">
                  <small>Home Appliance</small>
                </label>
              </div>
            </div>
            <a href="#" class="btn btn-dark mt-3 col-md-12">Clear Filter</a><br/>
            <a href="#" class="btn btn-success mt-4 col-md-12">Apply Filter</a>
          </div>
        </div>
      </div>
      <div class= "ml-4">
        <Post/>
      </div>
    </div>
  </div>
</template>

<script>
import Post from "@/components/common/Post.vue";
export default {
  name: "ViewPosts",
  data() {
    return {
      isMenu: false,
    };
  },
  components: {
    Post
  },
};
</script>
