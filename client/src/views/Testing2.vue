<template>
  <div class="test pt-5">
    <div class="comment">
      <h4>All Comments</h4>
      <p v-for="comment in comments" :key="comment.comment_id">
        <pre>{{comment}}</pre>
        <pre>{{comment.id}}</pre>
      </p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default{
  name: 'comment',
  data (){
    return{
      comments:[]
    }
  },
  methods: {
    getComments() {
      let url = '/apinew/testing/'
      axios({
        method: 'get',
        url: url,
      })
      .then(response => {
        this.comments = response.data.posts
      })
      .catch(error => {
        console.error(error)
      })  
    }
  },
  mounted() {
    this.getComments()
  },
} 
</script>
