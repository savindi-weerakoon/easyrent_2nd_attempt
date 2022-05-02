<template>
  <div class="home">
    <slider />
    <section class="container mb-5 category text-center">
      <h3>Top Categories</h3>
      <TopCategories />
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
      <h3>Mostly Rented Items</h3>
      <Post />
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
      <h3>Top Rated Items</h3>
      <Post />
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
import Post from "@/components/common/Post.vue";
import TopCategories from "@/components/common/TopCategories.vue";
export default {
  name: "Home",
  data() {
    return {
      isMenu: false,
    };
  },
  components: {
    Slider,
    Post,
    TopCategories,
  },
};
</script>
