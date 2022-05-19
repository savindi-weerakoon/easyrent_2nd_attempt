<template>
  <div class="container pt-5">
    <div class="row">
      <h3>Items rented by me</h3>
    </div>
    <div class="row">
      <div v-if="rents.length > 0" class="row row-post">
      <div class="col-md-4" v-for="rent in rents" :key="rent.id">
        <Post :post="rent"/>
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
        type: Object
      }
    },
  components: {
    Post,
  },
  methods: {
    getRentedbyMe() {
      const url = "/apinew/report_rentedbyme/";
      var form = new FormData();
      debugger
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