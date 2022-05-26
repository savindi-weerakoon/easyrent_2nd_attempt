<template>
  <div class="header shadow">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <router-link class="navbar-brand" to="/">EasyRent</router-link>
        <HeaderNav :user="user" />
        <ul v-if="user" class="navbar-nav">
          <li class="nav-item">
            <router-link class="btn btn-outline-success" to="/createPost">Add Your Advert</router-link>
          </li>
          <li class="nav-item ml-3">
            <a class="nav-link" type="button" @click="logout"><small>Logout</small></a>
          </li>
        </ul>
        <ul v-else class="navbar-nav">
          <li class="nav-item active">
            <router-link class="btn btn-success" to="/login">Login</router-link>
          </li>
        </ul>
        <!-- <test v-if="user" :username="user.firstname"/> -->
      </div>
    </nav>
  </div>
</template>

<script>
import HeaderNav from "@/components/common/HeaderNav.vue";
import Cookies from "js-cookie";
export default {
  name: "Header",
  data() {
    return {
      isMenu: false,
    };
  },
  props: {
    user: {
      type: Object,
    },
  },
  components: {
    HeaderNav,
  },
  methods: {
    logout() {
      Cookies.remove("token");
      Cookies.remove("user");
      this.$router.push({ path: "/" });
      setTimeout(() => {
        document.location.reload(true);
      }, 1000);
    }
  }
};
</script>

<style lang="scss" scoped>
.header {
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 999;
}
</style>