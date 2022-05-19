<template>
  <div
    class="list-group"
    v-for="notification in notifications"
    :key="notification.id"
    :value="notification.id"
  >
    <a
      href="#"
      class="
        list-group-item list-group-item-action
        flex-column
        align-items-start
        active
      "
    >
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">{{ notification.post_title }}</h5>
        <small>{{formattedDate(notification.timestamp)}}</small>
      </div>
      <p v-if="notification.is_renter == true && notification.reservation_state == 0" class="mb-1">
        {{notification.tenant_firstname}} {{notification.tenat_lastname}} is waiting to reserve your {{notification.post_title}}
      </p>
      <p v-else-if="notification.is_renter == false && notification.reservation_state == 0" class="mb-1">
        Your request to rent {{notification.renter_firstname}} {{notification.renter_lastname}}'s {{notification.post_title}} is waiting. Please make the payment to proceed
      </p>
      <p v-else-if="notification.is_renter == true && notification.reservation_state == 1" class="mb-1">
        {{notification.tenant_firstname}} {{notification.tenat_lastname}} has made the payment for your {{notification.post_title}}
      </p>
      <p v-else-if="notification.is_renter == false && notification.reservation_state == 1" class="mb-1">
        You have made the payments for Kamal Perera's {{notification.post_title}}
      </p>
      <p v-else-if="notification.is_renter == true && notification.reservation_state == 3" class="mb-1">
        You have successfully accepted the reservation
      </p>
      <p v-else-if="notification.is_renter == false && notification.reservation_state == 3" class="mb-1">
        Your reservation has been successfully accepted
      </p>
      <p v-else-if="notification.is_renter == true && notification.reservation_state == 2" class="mb-1">
        You have rejected the reservation
      </p>
      <p v-else-if="notification.is_renter == false && notification.reservation_state == 2" class="mb-1">
        Owner has rejected the reservation
      </p>
      <p v-else class="mb-1">
        Owner has received the item
      </p>
      <!-- <p class="mb-1">
        {{ notification.tenant_firstname }}
        {{ notification.tenant_firstname }} is trying to reserve your
        {{ notification.post_title }}.
      </p> -->
    </a>
  </div>
</template>
<script>
import axios from "axios";
import moment from "moment";
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
    formattedDate(rowDate) {
      return moment(rowDate).format("YYYY-MM-DD")
    },
    // userId() {
    //   let url = '/apinew/getNotifications/'
    //   var form = new FormData();
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
    // getNotifications() {
    //   const url = "/apinew/getNotifications/";
    //   axios({
    //     method: "get",
    //     url: url,
    //   })
    //     .then((response) => {
    //       if (response.status === 200) {
    //         this.notifications = response.data.notifications;
    //       }
    //     })
    //     .catch((error) => {
    //       console.error(error);
    //     });
    //   },
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
