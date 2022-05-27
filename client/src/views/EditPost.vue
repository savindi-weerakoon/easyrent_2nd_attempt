<template>
  <div class="container py-4">
    <div class="row justify-content-center">
      <div class="col-md-6">
          <div class="row">
            <div class="col-12">
              <div class="form-group full-width">
                <label>Item Name </label>
                <input class="form-control" placeholder="Canon 123" v-model="post.post_title" />
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group full-width">
                <label>Description</label>
                <textarea
                  class="form-control"
                  style="min-height: 200px"
                  placeholder="This is a cannon camera" v-model="post.content"
                ></textarea>
                <hr class="mb-1" />
              </div>
            </div>
          </div>
          <div class="col-md-6">
              <div class="form-group">
                <label>Rent Price</label>
                <input
                  class="form-control"
                  type="number"
                  placeholder="1500" 
                  v-model="post.price"
                />
              </div>
            </div>
            <div class="row">
            <div class="col-md-12">
              <div class="w-100 d-flex justify-content-end">
                <router-link
                  class="btn btn-outline-success mb-4 mr-3"
                  :to="'/dashboard/rentedByMe/'"
                  >Cancel
                </router-link>
                <button type="button" class="btn btn-success mb-4" @click="updateUser">
                  Update Post
                </button>
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
   data() {
    return {
     post: [],
    }
   },
  computed: {
    postId () {
      return parseInt(this.$route.params.post_id)
    },
  },
  methods:{
    getPost() {
      const url = "/apinew/getPostToEdit/";
      var form = new FormData();
      form.append("post_id", this.postId);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            this.post = response.data.post;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    updateUser() {
      let url = "/apinew/editPost/";
      var form = new FormData();
      // form.append("image_id", this.profile.image_id);
      form.append("post_id", this.postId);
      form.append("post_title", this.post.post_title);
      form.append("price", this.post.price);
      form.append("content", this.post.content);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.$toast.success('You have successfully updated your post')
          this.$router.push({ path: "/" });
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  mounted() {
    this.getPost();
  },
}
</script>