<template>
  <div class="container pt-5">
    <div class="row">
      <h3>Pending Payments</h3>
    </div>
    <div class="row">
      <!-- <div v-if="rents && rents.length > 0" class="row row-post">
        <div class="col-md-4" v-for="rent in rents" :key="rent.id">
          <Post :post="rent" />
        </div>
      </div> -->

      <table class="table">
        <thead>
          <tr>
            <th>Post Title</th>
            <th>payment Status</th>
            <th>Message</th>
            <th>Condition</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="notification in notifications" :key="notification.id" :value="notification.id">
            <td>
              <router-link :to="`/postView/${notification.post_id}`">{{
                notification.post_title
              }}</router-link>
            </td>
            <td>
              ........
            </td>
            <td>
              ......
            </td>
            <td>
              
            </td>
          </tr>
        </tbody>
      </table>
    </div>
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
    getNotifications() {
      const url = "/apinew/getNotifications/";
      var form = new FormData();
      debugger;
      form.append("user_id", this.user.user_id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            debugger;
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
  },
};
</script>
 