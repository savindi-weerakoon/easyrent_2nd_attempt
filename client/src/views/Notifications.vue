<template>
<div class="list-group" v-for="notification in notifications" :key="notification.id" :value="notification.id">
  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">List group item heading</h5>
      <small>3 days ago</small>
    </div>
    <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
    <small>Donec id elit non mi porta.</small>
  </a>
</div>
</template>
<script>
import axios from "axios";
export default {
  name: "notifications",
  data() {
    return {
      notifications: [],
    };
  },
  props: {
    user: {
      type: Object,
    },
  },
  methods: {
    // userId() {
    //   let url = '/apinew/getNotifications/'
    //   var form = new FormData();
    //   debugger
    //   form.append("user_id", 30);
    //   axios({
    //     method: "post",
    //     url: url,
    //     data: form,
    //   })
    //     .then((response) => {
    //       console.log(response);
    //     })
    //     .catch((error) => {
    //       console.error(error);
    //     });
    // },
    getNotifications() {
      const url = "/apinew/getNotifications/";
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          if (response.status === 200) {
            debugger
            this.notifications = response.data.notifications;
          }
        })
        .catch((error) => {
          console.error(error);
        });
      },
  },
  mounted() {
  this.getNotifications();
}
}
</script>
