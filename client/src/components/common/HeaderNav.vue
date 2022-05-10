<template>
  <div class="HeaderNav">
    <div class="d-flex flex-row-reverse">
      <router-link
          type="button"
          class="btn btn-success mt-2 mb-2 ml-2"
          :to="'/createPost'"
          >Add Post</router-link
        >
      <div class="p-2"></div>
      <div class="p-2">
        <button type="button" class="btn btn-secondary"> <router-link cls to="/profile" class="text-light">Profile </router-link></button>
      </div>
      <div class="p-2">
        <button type="button" class="btn btn-secondary"> <router-link cls to="/login" class="text-light">Login </router-link></button>
      </div>
      <div class="p-2">
        <button type="button" class="btn btn-secondary"> <router-link cls to="/viewPosts" class="text-light">Shop</router-link></button>
      </div>
      <div class="p-2">
        <button type="button" class="btn btn-secondary"> <router-link cls to="/" class="text-warning">
          Home
          </router-link>
        </button>
      </div>
    </div>
  </div>
</template>


<script>
export default {
  name: "header-nav",
};
</script>