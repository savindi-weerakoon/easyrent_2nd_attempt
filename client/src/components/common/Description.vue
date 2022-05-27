<template>
  <div class="reviews-container">
    <!-- <div v-if="reviews.length > 0" class="row row-post"> -->
    <ul v-if="post" class="pl-0">
      <li class="list-group-item bg-light mt-3 pt-2 pb-0 pl-4 pr-4">
        <p>{{post.content}}</p>
      </li>
    </ul>
    <!-- </div> -->
    <!-- <div v-else class="row"> -->
      <!-- <div class="col-12 mt-5">
          <div class="alert alert-dark">
            There are no reviews at the moment
          </div>
    </div>
  </div> -->
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "ViewPosts",
  data() {
    return {
      post_id: 1,
      post: null,
    };
  },
  props: {
    description: {
      type: Object,
    },
    postId: {
      type: Number,
    },
  },
  components: {
  },
  methods:{
    getDescriptionView() {
      const url = "/apinew/getDescriptionDetails/";
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
  },
  mounted() {
    this.getDescriptionView();
  },
};
</script>
