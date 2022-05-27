<template>
  <div class="container item-review">
    <div class="row">
      <div class="col-md-8 col-lg-6 mt-5 offset-md-3 mb-3">
        <div class="text-center">
          <h3>Rate the user</h3>
        </div>
        <div class="col-12 mt-4">
          <div class="row">
            <h5 class="mb-2 ml-3 text-center">Customer</h5>
          </div>
          <!-- <div class="col-md-12 mt-2 mb-3"> -->
          <h7 class="mt-3">Tab a star to rate</h7>
          <!-- </div> -->
          <form>
            <div class="form-group mb-2 mt-2">
              <star-rating :star-size="24" :show-rating="false" v-model:rating="rating"></star-rating>
            </div>
            <div class="form-group mb-2 mt-3">
              <label for="comment">Review</label>
              <div class="suggetions mb-2">
                <!-- <span
                  class="badge badge-pill badge-secondary mr-1"
                  role="button"
                  v-for="(suggetion, index) in suggetions"
                  :key="index"
                  @click="quickPick(suggetion)"
                  >{{ suggetion }}</span
                > -->
              </div>
              <textarea class="form-control" id="desc" rows="4" v-model="review">this is ttt</textarea>
            </div>
          </form>
          <div class="w-100 d-flex justify-content-end mt-3">
            <button class="btn btn-m mr-3" type="reset">
              <i class="glyphicon glyphicon-repeat"></i> Dismiss
            </button>
            <button class="btn btn-m btn-success ml-5" type="submit" @click="userReview">
              <i class="glyphicon glyphicon-ok-sign"></i> Submit
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import StarRating from "vue-star-rating";
export default {
  name: "add-review",
  data() {
    return {
      rating: 5,
      review: '',
    }
  },
  components: {
    StarRating,
  },
  props: {
    user: {
      type: Object,
    },
  },
  computed: {
    tenantId () {
      return parseInt(this.$route.params.tenant_id)
    },
    postId () {
      return parseInt(this.$route.params.post_id)
    },
  },
  methods:{
    userReview() {
      let url = '/apinew/reviewUser/'
      var form = new FormData();
      form.append("tenant_id", this.tenantId);
      form.append("post_id", this.postId);
      form.append("user_id", this.user.user_id);
      form.append("rate", this.rating);
      form.append("review", this.review);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.$toast.success('You have successfully rated the user');
          this.$router.push({ path: "/" });
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
};
</script>