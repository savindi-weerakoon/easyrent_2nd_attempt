<template>
  <div class="HeaderNav">
    <div class="d-flex flex-row-reverse">
      <div class="p-2"></div>
      <div v-if="user">
        <div class="p-2">
          <button type="button" class="btn btn-secondary">
            <router-link cls to="/profile" class="text-light"
              >Profile
            </router-link>
          </button>
        </div>
        <div class="p-2">
          <button type="button" class="btn btn-secondary">
            <router-link cls to="/" class="text-light" @click="getlogout"
              >Logout
            </router-link>
          </button>
        </div>
        <div class="p-2">
          <button type="button" class="btn btn-secondary">
            <router-link cls to="/viewPosts" class="text-light"
              >Shop</router-link
            >
          </button>
        </div>
      </div>
      <div v-else>
        <div class="p-2">
          <button type="button" class="btn btn-secondary">
            <router-link cls to="/login" class="text-light">Login </router-link>
          </button>
        </div>
        <div class="p-2">
          <button type="button" class="btn btn-success">
            <router-link cls to="/createPost" class="text-light"
              >Add Post</router-link
            >
          </button>
        </div>
        <div class="p-2">
          <button type="button" class="btn btn-secondary">
            <router-link cls to="/" class="text-warning"> Home </router-link>
          </button>
        </div>
      </div>
    </div>
  </div>
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