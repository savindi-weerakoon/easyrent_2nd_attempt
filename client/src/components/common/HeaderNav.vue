<template>
  <ul class="navbar-nav mr-auto">
    <li class="nav-item">
      <router-link class="nav-link" active-class="active" to="/">Home</router-link>
    </li>
    <li class="nav-item">
      <router-link class="nav-link" active-class="active" to="/viewPosts">Shop</router-link>
    </li>
    <li v-if="user" class="nav-item">
      <router-link class="nav-link" active-class="active" to="/dashboard">Dashboard</router-link>
    </li>
    <li v-if="user" class="nav-item active">
      <router-link class="nav-link" active-class="active" to="/profile">Profile</router-link>
    </li>
  </ul>
</template>


<script>
import Cookies from "js-cookie";
export default {
  name: "header-nav",
  data() {},
  props: {
    user: {
      type: Object,
    },
  },
  methods: {
    getlogout() {
      Cookies.remove("token");
      Cookies.remove("user");
    },
  },
};
</script>