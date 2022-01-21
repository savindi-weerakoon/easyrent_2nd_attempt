<template>
  <Header/>
  <router-view/>
</template>

<style lang="scss">
// imported bootstrap globally
@import url('assets/styles/bootstrap-4.3.1.css');
</style>

<script>
import Header from "@/components/common/Header.vue";
export default {
  name: "App",
  data() {
    return {
      isMenu: false,
    };
  },
  components: {
    Header,
  },
};
</script>