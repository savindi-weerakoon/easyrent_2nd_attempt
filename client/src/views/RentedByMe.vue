<template>
  <div>
    <div class="row">
      <h5>Items rented by me</h5>
    </div>
    <div class="row">
      <div v-if="rents.length > 0" class="row row-post">
        <div class="col-md-6" v-for="rent in rents" :key="rent.id">
          <Post :post="rent">
            <div class="card-body">
              <div class="row">
                <div class="col-12">
                  <router-link
                    class="btn btn-primary text-nowrap w-100 mb-2"
                    :to="`/editPost/${rent.post_id}/`"
                    >Edit the Post
                  </router-link>
                </div>
                <div class="col-12" v-if="rent.available == 1">
                  <button
                    type="button"
                    class="btn btn-outline-danger form-control"
                    @click="makeUnavailable(rent.post_id)"
                  >
                    Make unavailable
                  </button>
                </div>
                <div class="col-12" v-else>
                  <button
                    type="button"
                    class="btn btn-outline-success form-control text-wrap"
                    @click="makeAvailable(rent.post_id)"
                  >
                    Make available
                  </button>
                </div>
              </div>
            </div>
          </Post>
        </div>
      </div>
      <div v-else class="row">
        <div class="col-12 mt-5">
          <div class="alert alert-dark">
            Sorry, there are no items posted by you
          </div>
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
    };
  },
  props: {
    user: {
      type: Object,
    },
  },
  components: {
    Post,
  },
  methods: {
    getRentedbyMe() {
      const url = "/apinew/report_rentedbyme/";
      var form = new FormData();
      form.append("renter_id", this.user.user_id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            this.rents = response.data.rent;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    makeUnavailable(id) {
      const url = "/apinew/makePostUnavailable/";
      var form = new FormData();
      form.append("id", id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.getRentedbyMe();
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    makeAvailable(id) {
      const url = "/apinew/makePostAvailable/";
      var form = new FormData();
      form.append("id", id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.getRentedbyMe();
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    // getRentedbyMe() {
    //   let url = "/apinew/report_rentedbyme/";
    //   axios({
    //     method: "get",
    //     url: url,
    //   })
    //     .then((response) => {
    //       if (response.status === 200) {
    //         this.rents = response.data.rent;
    //       }
    //     })
    //     .catch((error) => {
    //       console.error(error);
    //     });
    // },
  },
  mounted() {
    this.getRentedbyMe();
  },
};
</script>