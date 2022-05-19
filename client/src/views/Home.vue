<template>
  <div class="home">
    <slider />
    <section class="container mb-5 category text-center">
      <h3>Top Categories</h3>
      <div class="row">
        <div class="row">
        <CategoryList :categories="categories" />
      </div>
      </div>
      <div class="button col-md-3 mt-3 mb-3 text-center offset-lg-5 mt-5">
        <router-link
          type="button"
          class="btn btn-success mt-3"
          :to="'/categories'"
          >View All Categories</router-link
        >
      </div>
    </section>

    <section class="container mb-5 category text-center">
      <h3>Top Rated Items</h3>
      <div class="row">
        <div class="col-3" v-for="post in rated" :key="post.post_id">
          <Post :post="post"/>
        </div>
      </div>
      <div class="button col-md-2 mt-3 mb-3 text-center offset-lg-5 mt-5">
        <router-link
          type="button"
          class="btn btn-success mt-3"
          :to="'/viewPosts'"
          >View All Items</router-link
        >
      </div>
    </section>

    <section class="container mb-5 category text-center">
      <h5>
        Are you still not having an account. Sign up and enjoy the benefits
      </h5>
      <div class="button col-md-2 mt-3 mb-3 text-center offset-lg-5 mt-5">
        <button
          type="button"
          class="btn btn-success form-control"
          @click="checkUsernameValidity"
        >
          Sign-Up, It's Free
        </button>
      </div>
    </section>
  </div>
</template>

<script>
import Slider from "@/components/common/Slider.vue";
import axios from "axios";
import Post from "@/components/common/Post.vue";
import CategoryList from "@/components/common/CategoryList.vue";
export default {
  name: "Home",
  data() {
    return {
      isMenu: false,
      posts: [],
      categories: [],
      topItems: [],
      rated:[],
    };
  },
  components: {
    Slider,
    Post,
    CategoryList
    // TopCategories,
  },
  methods: {
    // getHomeData() {
    //   let url = "/apinew/getHomePageData/";
    //   axios({
    //     method: "get",
    //     url: url,
    //   })
    //     .then((response) => {
    //       if (response.status === 200) {
    //         this.posts = response.data.rented_items;
    //         this.categories = response.data.top_categories;
    //         this.topItems = response.data.top_items;
    //       }
    //     })
    //     .catch((error) => {
    //       console.error(error);
    //     });
    // },
    getCategoriesWithCountLimited () {
      let url = '/apinew/getCategoriesWithCountLimited/'
      axios({
        method: 'get',
        url: url
      })
      .then(response => {
        if (response.status === 200) {
          this.categories = response.data.withCount
        }
      })
      .catch(error => {
        console.error(error)
      });
    },
    topRatedItems () {
      let url = '/apinew/TopRatedItems/'
      axios({
        method: 'get',
        url: url
      })
      .then(response => {
        if (response.status === 200) {
          debugger
          this.rated = response.data.rated
        }
      })
      .catch(error => {
        console.error(error)
      });
    }
  },
  mounted() {
    // this.getHomeData()
    this.getCategoriesWithCountLimited()
    this.topRatedItems()
  },
};
</script>
