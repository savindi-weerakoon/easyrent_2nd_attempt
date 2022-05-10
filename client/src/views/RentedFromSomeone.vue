<template>
  <div class="container pt-5">
    <div class="row">
      <h3>Items rented from someone</h3>
    </div>
    <div class="row">
      <div v-if="rents.length > 0" class="row row-post">
      <div class="col-md-3" v-for="rent in rents" :key="rent.id">
        <Post :post="rent"/>
      </div>
      </div>
      <div v-else class="row">
        <div class="col-12 mt-5">
          <div class="alert alert-dark">
            Sorry, there are no items rented by you from someone
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
  components: {
    Post,
  },
  methods: {
    getRentedbyMe() {
      let url = "/apinew/report_rentedbysomeone/";
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          debugger;
          if (response.status === 200) {
            debugger;
            this.rents = response.data.rent;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  mounted() {
    this.getRentedbyMe();
  },
};
</script>