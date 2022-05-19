<template>
  <div class="container pt-5">
    <div v-if="user.role_id == 1">
    <div class="row">
      <h3>Pending Posts</h3>
    </div>
    <div class="row">
      <!-- <div v-if="rents && rents.length > 0" class="row row-post">
        <div class="col-md-4" v-for="rent in rents" :key="rent.id">
          <Post :post="rent" />
        </div>
      </div> -->

      <table v-if="rents && rents.length > 0" class="table">
        <thead>
          <tr>
            <th>Post Title</th>
            <th>Post Category</th>
            <th>Price</th>
            <th>Accept or Reject</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="rent in rents" :key="rent.post_id">
            <td>
              <router-link :to="`/postView/${rent.post_id}`">{{
                rent.post_title
              }}</router-link>
            </td>
            <td>{{ rent.category_name }}</td>
            <td>{{ rent.price }}</td>
            <td>
              <button type="button" class="btn btn-success mr-3" @click="accept(rent.post_id)">Accept</button>
              <button type="button" class="btn btn-danger mr-3" @click="reject(rent.post_id)">Reject</button>
            </td>
          </tr>
        </tbody>
      </table>
      <div v-else class="col">
        <div class="col-12 mt-5">
          <div class="alert alert-dark">
            There are no items under pending state
          </div>
        </div>
      </div>
      </div>
    </div>
    <div v-else class="col">
      <h4>My Pending Posts</h4>
      <div v-if="posts && posts.length > 0" class="row">
        <div v-for="post in posts" :key="post.post_id">
          <Post :post="post"/>
        </div>
      </div>
      <div v-else class="col-ml-3 mt-2">
        <div class="alert alert-dark">
            You do not have items under pending state
          </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import Post from "@/components/common/Post.vue";
export default {
  data() {
    return {
      rents: [],
      post_id: 1,
      posts:[],
    };
  },
  props: {
    user: {
      type: Object,
    },
    postId: {
      type: Number,
    },
  },
  components: {
    Post,
  },
  methods: {
    getPendingPosts() {
      const url = "/apinew/getPendingPosts/";
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          if (response.status === 200) {
            this.rents = response.data.posts;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getOwnersPosts() {
      const url = "/apinew/getOwnersPosts/";
      var form = new FormData();
      form.append("user_id", this.user.user_id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            debugger
            this.posts = response.data.posts;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    accept(id){
      const url = "/apinew/changePendingToActive/";
      var form = new FormData();
      form.append("post_id", id);
      debugger
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          debugger
          this.getPendingPosts();
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    reject(id){
      const url = "/apinew/changePendingToReject/";
      var form = new FormData();
      form.append("post_id", id);
      debugger
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          debugger
          this.getPendingPosts();
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  mounted() {
    this.getPendingPosts();
    this.getOwnersPosts()
  },
};
</script>