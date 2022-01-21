<template>
  <div class="Header">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <router-link class="navbar-brand" to="/">EasyRent</router-link>
        <HeaderNav />
      </div>
    </nav>
  </div>
</template>

<script>
import HeaderNav from "@/components/common/HeaderNav.vue";
export default {
  name: "Header",
  data() {
    return {
      isMenu: false,
    };
  },
  components: {
    HeaderNav,
  },
};
</script>