<template>
  <div class="HeaderNav">
    <div class="d-flex flex-row-reverse">
      <div class="p-2"></div>
      <div class="p-2">
        <button type="button" class="btn btn-secondary"> <router-link cls to="/login" class="text-light">Login </router-link></button>
      </div>
      <div class="p-2">
        <button type="button" class="btn btn-secondary"> <router-link cls to="/shop" class="text-light">Shop</router-link></button>
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