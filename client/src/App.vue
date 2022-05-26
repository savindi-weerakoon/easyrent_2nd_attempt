<template>
  <Header :user="userObj" />
  <router-view class="page pt-2 mt-5" :user="userObj" />
  <footer class="container-fluid bg-dark">
    <div class="container">
      <div class="row">
        <div class="col-12 py-2">
          <p class="mb-0 text-right text-white">
            <small>All rights reserved by EasyRent.LK - © {{ year }}</small>
          </p>
        </div>
      </div>
    </div>
  </footer>
</template>

<style lang="scss">
// imported bootstrap globally
@import url("assets/styles/bootstrap-4.3.1.css");
@import url("assets/styles/common.css");
</style>

<script>
import Header from "@/components/common/Header.vue";
import Cookies from "js-cookie";
import moment from "moment";

export default {
  name: "App",
  data() {
    return {
      isMenu: false,
      user: null,
    };
  },
  components: {
    Header,
  },
  computed: {
    year() {
      return moment().format("YYYY");
    },
    userObj() {
      const user = Cookies.get("user");
      if (user && user !== "undefined") {
        return JSON.parse(user);
      }
      return null;
    },
  },
  methods: {},
};
</script>