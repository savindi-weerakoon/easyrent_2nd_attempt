<template>
  <div class="post pt-5">
    <div class = "posts">
     <h4>All Posts</h4>
     <!-- <pre>{{posts}}</pre> -->
     <p v-for="post in posts" :key="post.post_id">
       <pre>{{post}}</pre>
     </p>
    </div>
  </div>  
</template>

<script>
import axios from 'axios'
export default {
  name: 'post',
  data () {
    return {
      posts:[]
    }
  },
  methods: {
    getPosts() { 
      let url = 'https://jsonplaceholder.typicode.com/posts'
      axios({
        method: 'get',
        url: url,
      })
      .then(response => {
        this.posts = response.data
        console.log(response.data)
      })
      .catch(error => {
        console.error(error)
      })
    }
  },
  mounted() {
    this.getPosts()
  },
};
</script>