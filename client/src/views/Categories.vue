<template>
  <div class="container pt-5">
    <section class="category">
      <div class="row">
        <div class="col-md-12 text-left mb-3">
          <h3>All Categories</h3>
        </div>
      </div>
      <CategoryList :categories="categories"/>
    </section>
  </div>
</template>

<script>
import axios from 'axios';
import CategoryList from "@/components/common/CategoryList.vue";
export default {
  name: 'category',
  data() {
    return {
      categories: []
    };
  },
  components: {
    // post: () => import("@/components/feed/post"),
    CategoryList,
  },
  computed: {
  },
  methods: {
    getCategoriesWithCount () {
      debugger;
      let url = '/apinew/getCategoriesWithCount/'
      axios({
        method: 'get',
        url: url
      })
      .then(response => {
        debugger;
        if (response.status === 200) {
          debugger;
          this.categories = response.data.withCount
        }
      })
      .catch(error => {
        console.error(error)
      });
    }
  },
  mounted () {
    this.getCategoriesWithCount()
  }
}
</script>