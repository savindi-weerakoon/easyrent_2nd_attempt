<template>
  <div class="container pt-5">
    <div class="categories">
      <div v-if="posts.length > 0" class="row">
        <div class="col-md-3 mb-4" v-for="post in posts" :key="post.post_id">
          <Post :post="post"> 
            <div class="row">
              <div class="col-12 ml-3">
            {{post.category_name}} 
            </div>
            </div>
          </Post>
        </div>
      </div>
      <div v-else class="row">
        <div class="col-12">
          <div class="alert alert-dark">
            Sorry, there are no posts in this category
          </div>
        </div>
      </div> 
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Post from "@/components/common/Post.vue";
export default {
  name: "category",
  data() {
    return {
      posts: []
    }
  },
  components: {
    Post,
  },
  computed: {
    categoryId () {
      return parseInt(this.$route.params.category_id)
    }
  },
  methods: {
    getPostsByCategory () {
      const url = '/apinew/getPostsByCategory/?category_id=' + this.categoryId
      axios({
        method: 'get',
        url: url
      })
      .then(response => {
        debugger
        if (response.status === 200) {
          this.posts = response.data.posts
        }
      })
      .catch(error => {
        console.error(error)
      });
    }
  },
  mounted () {
    this.getPostsByCategory()
  }
}
</script>
