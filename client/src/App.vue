<template>
  <Header :user="userObj"/>
  <router-view :user="userObj"/>
</template>

<style lang="scss">
// imported bootstrap globally
@import url('assets/styles/bootstrap-4.3.1.css');
</style>

<script>
import Header from "@/components/common/Header.vue";
import Cookies from 'js-cookie'

export default {
  name: "App",
  data() {
    return {
      isMenu: false,
      user: null
    };
  },
  components: {
    Header,
  },
  computed: {
    userObj() {
      const user = Cookies.get('user');
      if (user) {
        return JSON.parse(user);
      }
      return null;
    }
  },
  methods: {
  },
};
</script>