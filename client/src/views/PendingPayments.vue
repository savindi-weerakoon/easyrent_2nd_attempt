<template>
  <div>
    <h5>Transactions</h5>
    <div v-if="notifications.length > 0">
      <table class="table">
        <thead>
          <tr>
            <th>Post Title</th>
            <th class="text-nowrap">From Date</th>
            <th class="text-nowrap">To Date</th>
            <th class="text-right">Condition</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="notification in notifications"
            :key="notification.id"
            :value="notification.id"
          >
            <td>
              <router-link :to="`/postView/${notification.post_id}`">{{
                notification.post_title
              }}</router-link>
            </td>
            <td>
              <small class="text-nowrap">{{
                onlyDate(notification.from_date)
              }}</small>
            </td>
            <td>
              <small class="text-nowrap">{{
                onlyDate(notification.to_date)
              }}</small>
            </td>
            <td class="text-right">
              <div
                v-if="
                  notification.is_renter == true &&
                  notification.reservation_state == 0
                "
              >
                <p>Do you want to reject reservation due to non-payment?</p>
                <button
                  type="button"
                  class="btn px-4 btn-success mr-3"
                  @click="rejectReservation(notification.id)"
                >
                  Yes
                </button>
              </div>
              <div
                v-else-if="
                  notification.is_renter == false &&
                  notification.reservation_state == 0
                "
              >
                <p>Make the payment</p>
                <div class="row">
                  <div class="col-md-12 input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text">Upload</span>
                    </div>
                    <div class="custom-file">
                      <input
                        type="file"
                        class="custom-file-input"
                        id="inputGroupFile01"
                        @change="uploadSlip($event, notification)"
                      />
                      <label class="custom-file-label" for="inputGroupFile01"
                        >Click to upload bank slip</label
                      >
                    </div>
                  </div>
                  <div class="col-4" v-if="notification.bankSlipFileName">
                    <img
                      class="img-thumbnail shadow-sm w-100"
                      :src="`http://localhost/easyrentnew/apinew/uploads/bank_slip/${notification.bankSlipFileName}`"
                    />
                  </div>
                  <div class="col-8">
                    <button
                      type="button"
                      class="btn px-4 btn-success"
                      @click="submit(notification)"
                    >
                      Submit
                    </button>
                  </div>
                </div>
              </div>
              <div
                v-else-if="
                  notification.is_renter == true &&
                  notification.reservation_state == 1
                "
              >
                <p>
                  The one who wants to make the payment has made the payment
                </p>
                <div class="row">
                  <div class="col-md-8">
                    <button
                      type="button"
                      class="btn px-4 btn-success mr-3"
                      @click="acceptBankSlip(notification.id)"
                    >
                      Accept
                    </button>
                    <button
                      type="button"
                      class="btn px-4 btn-danger"
                      @click="rejectBankSlip(notification.id)"
                    >
                      Reject
                    </button>
                  </div>
                  <div class="col-md-4 mb-3" v-if="notification.image_name">
                    <img
                      @click="notification.slipModalShow = true"
                      class="img-thumbnail shadow-sm w-100 cursor-pointer"
                      :src="`http://localhost/easyrentnew/apinew/uploads/bank_slip/${notification.image_name}`"
                    />
                  </div>
                </div>
                <ConfirmationModal
                  v-if="notification.slipModalShow"
                  @cancel="notification.slipModalShow = false"
                  :cancelLabel="'Close'"
                >
                  <img
                    class="shadow-sm w-100"
                    :src="`http://localhost/easyrentnew/apinew/uploads/bank_slip/${notification.image_name}`"
                  />
                </ConfirmationModal>
              </div>
              <div
                class="col-md-8"
                v-else-if="
                  notification.is_renter == false &&
                  notification.reservation_state == 1
                "
              >
                <p>
                  Your payment is waiting for the approval from the item owner
                </p>
              </div>
              <div
                v-else-if="
                  notification.is_renter == false &&
                  notification.reservation_state == 3
                "
              >
                <p>Owner has accepted your reservation</p>
              </div>
              <div
                v-else-if="
                  notification.is_renter == true &&
                  notification.reservation_state == 2
                "
              >
                <p>You have rejected the reservation</p>
              </div>
              <div
                v-else-if="
                  notification.is_renter == false &&
                  notification.reservation_state == 2
                "
              >
                <p>Owner has accepted your reservation</p>
              </div>
              <div
                v-else-if="
                  notification.is_renter == true &&
                  notification.reservation_state == 3
                "
              >
                <p>I have received the item</p>
                <button
                  type="button"
                  class="btn px-4 btn-success mr-3"
                  @click="received(notification.id)"
                >
                  Yes
                </button>
                <button type="button" class="btn px-4 btn-danger mr-3">No</button>
              </div>
              <div
                v-else-if="
                  notification.is_renter == true &&
                  notification.reservation_state == 4
                "
              >
                <p>
                  Now you can express your experience about the tenant. Rate and
                  review the customer
                </p>
                <router-link
                  class="btn px-4 btn-outline-success mb-4"
                  :to="`/addUserReview/${notification.tenant_id}/${notification.post_id}`"
                  >Rate and Review
                </router-link>
              </div>
              <div
                v-else-if="
                  notification.is_renter == false &&
                  notification.reservation_state == 4
                "
              >
                <p>
                  Now you can express your experience about the rented item.
                  Rate and review the item
                </p>
                <router-link
                  class="btn px-4 btn-outline-success mb-4"
                  :to="`/addItemReview/${notification.post_id}/${notification.id}/${notification.tenant_id}`"
                  >Rate and Review
                </router-link>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div v-else>
      <div class="alert alert-dark">You do not have any transactions</div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import ConfirmationModal from "@/components/common/ConfirmationModal.vue";
import moment from "moment";
export default {
  name: "notifications",
  data() {
    return {
      notifications: [],
      // bankSlip: {
      //   id: null,
      //   fileName: null,
      // },
    };
  },
  components: {
    ConfirmationModal,
  },
  props: {
    user: {
      type: Object,
    },
  },
  methods: {
    onlyDate(dateStr) {
      return moment(dateStr).format("YYYY-MM-DD");
    },
    uploadSlip(event, notification) {
      var formData = new FormData();
      formData.append("image", event.target.files[0]);
      axios
        .post("/apinew/uploadBankSlip/", formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
        .then((response) => {
          if (response.status === 200) {
            notification.bankSlipId = response.data.data.id;
            notification.bankSlipFileName = response.data.data.name;
          }
        })
        .catch((error) => {
          this.$toast.error(error.response.data.message);
        });
    },
    getNotifications() {
      const url = "/apinew/getNotifications/";
      var form = new FormData();
      form.append("user_id", this.user.user_id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            this.notifications = response.data.notifications;
          }
        })
        .catch((error) => {
          this.$toast.error(error.response.data.message);
        });
    },
    rejectReservation(id) {
      const url = "/apinew/changeReservationToActive/";
      var form = new FormData();
      form.append("id", id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.getNotifications();
          console.log(response);
        })
        .catch((error) => {
          this.$toast.error(error.response.data.message);
        });
    },
    submit(notification) {
      const url = "/apinew/changeReservationToUploaded/";
      var form = new FormData();
      form.append("id", notification.id);
      form.append("bank_slip_id", notification.bankSlipId);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.$toast.success(response.data.message);
          this.getNotifications();
        })
        .catch((error) => {
          this.$toast.error(error.response.data.message);
        });
    },
    acceptBankSlip(id) {
      const url = "/apinew/changeReservationToPaid/";
      var form = new FormData();
      form.append("id", id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.getNotifications();
          console.log(response);
        })
        .catch((error) => {
          this.$toast.error(error.response.data.message);
        });
    },
    rejectBankSlip(id) {
      const url = "/apinew/changeReservationToReject/";
      var form = new FormData();
      form.append("id", id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.getNotifications();
          console.log(response);
        })
        .catch((error) => {
          this.$toast.error(error.response.data.message);
        });
    },
    received(id) {
      const url = "/apinew/changeReservationToClosed/";
      var form = new FormData();
      form.append("id", id);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.getNotifications();
          console.log(response);
        })
        .catch((error) => {
          this.$toast.error(error.response.data.message);
        });
    },
  },
  mounted() {
    this.getNotifications();
  },
};
</script>
 