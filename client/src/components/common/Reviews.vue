<template>
  <div class="reviews-container">
    <!-- <div v-if="reviews.length > 0" class="row row-post"> -->
    <ul>
      <li class="list-group-item bg-light mt-3 pt-2 pb-0 pl-4 pr-4" v-for="(review, index) in reviewDetails" :key="index">
        <star-rating :star-size="24"></star-rating>
        <blockquote class="blockquote">
          <p class="mb-0"><small>{{reviewDetails.review}}</small></p>
          <footer class="blockquote-footer mt-2"><small>{{reviewDetails.firstname}} {{reviewDetails.lastname}}</small></footer>
          <p class="mt-1 mb-0"><small>{{reviewDetails.timestamp}}</small></p>
        </blockquote>
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
import StarRating from "vue-star-rating";
export default {
  name: "ViewPosts",
  data() {
    return {
      post_id: 1,
      reviewDetails:[],
    };
  },
  components: {
    StarRating,
  },
  methods:{
    getPost() {
      let url = "/apinew/getReviewDetails/";
      var form = new FormData();
      form.append("post_id", this.post_id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getCategoriesView() {
      let url = '/apinew/getReviewDetails/'
      axios({
        method: "get",
        url: url,
      })
      .then((response) => {
        if (response.status === 200) {
          debugger
          this.reviewDetails = response.data.reviewDetails;
        }
      })
      .catch(error => {
        console.error(error)
      })
    },
  },
    mounted() {
    this.getPost();
  },
};
</script>
