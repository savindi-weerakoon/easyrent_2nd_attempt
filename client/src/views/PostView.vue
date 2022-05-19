<template>
  <div v-if="post" class="container pt-5">
    <div class="row">
      <div class="col-md-7">
        <img
          :src="
            post.img
              ? `http://localhost/easyrentnew/apinew/uploads/items/${post.img}`
              : require('./../assets/images/No_Image_Available.jpg')
          "
          class="img-fluid"
          alt="Responsive image"
        />
      </div>
      <div class="col-md-5 mt-5">
        <h4>{{ post.post_title }}</h4>
        <div class="row">
          <h5 class="text-left mt-4 ml-3 mb-3">
            Rs. {{ finalPrice
            }}<small class="mt-5 ml-2">{{
              post.rent_type_id === 1 ? "Per Day" : "Per Duration"
            }}</small>
          </h5>
        </div>
        <div class="form-group">
          <star-rating
            :read-only="true"
            :star-size="24"
            :rating="post.avg_rate"
            :show-rating="false"
          ></star-rating>
        </div>
        <div class="w-100">
          <p class="mb-0">When do you want to rent it ?</p>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="datetimepicker6">From</label>
              <datepicker v-model="fromDate" :disabledDates="disabledDates" />
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="datetimepicker6">To</label>
              <datepicker v-model="toDate" :disabledDates="disabledDates" />
            </div>
          </div>
        </div>
        <div class="w-100">
          <h5>
            <span class="badge badge-success mt-3" :class="stateClass"
              >Available</span
            >
          </h5>
        </div>
        <div class="row">
          <div class="col-md-12">
            <p class="mt-3 mb-1">
              Owned by <strong>{{ post.firstname }} {{ post.lastname }}</strong>
            </p>
            <button
              type="button"
              class="btn btn-danger col-md-12"
              @click="clickReserve"
            >
              Request reserve
            </button>
          </div>
        </div>
      </div>
    </div>
    <nav>
      <div class="nav nav-tabs mt-4" id="nav-tab" role="tablist">
        <button class="nav-link" :class="{'active': selectedTabId === 1}" type="button" @click="selectedTabId = 1">
          Reviews
        </button>
        <button class="nav-link" :class="{'active': selectedTabId === 2}" type="button" @click="selectedTabId = 2">
          Description
        </button>
      </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
      <div
        v-if="selectedTabId === 1"
        class="tab-pane fade show active mt-3"
        id="nav-home"
        role="tabpanel"
        aria-labelledby="nav-home-tab"
      >
        <reviews :postId="postId"/>
      </div>
      <div
        v-else
        class="tab-pane fade show active mt-3 mb-4"
        id="nav-profile"
        role="tabpanel"
        aria-labelledby="nav-profile-tab"
      >
        <description :postId="postId"/>
        This is a high quality rental item<br/> you can rent this item whenever you want !
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import StarRating from "vue-star-rating";
import reviews from "@/components/common/Reviews.vue";
import description from "@/components/common/Description.vue";
import moment from "moment";
import Datepicker from "vue3-datepicker";
export default {
  name: "ViewPosts",
  data() {
    return {
      selectedTabId: 1,
      fromDate: null,
      toDate: null,
      disabledDates: {
        dates: [],
      },
      post: null,
    };
  },
  props: {
    user: {
      type: Object,
    },
  },
  components: {
    StarRating,
    Datepicker,
    reviews,
    description
  },
  computed: {
    postId() {
      return parseInt(this.$route.params.post_id);
    },
    daysLength() {
      debugger;
      const fromDate = moment(this.fromDate, 'YYYY-MM-DD');
      const toDate = moment(this.toDate, 'YYYY-MM-DD');
      return this.fromDate && this.toDate ? moment.duration(toDate.diff(fromDate)).asDays() : 1;
    },
    finalPrice() {
      return this.post.price * this.daysLength
    }
  },
  methods: {
    clickReserve() {
      const url = "/apinew/makeReservation/";
      var form = new FormData();
      const formattedFromDate = moment(this.fromDate).format("YYYY-MM-DD");
      const formattedToDate = moment(this.toDate).format("YYYY-MM-DD");
      form.append("tenant_id", this.user.user_id);
      form.append("from_date", formattedFromDate);
      form.append("to_date", formattedToDate);
      form.append("post_id", this.postId);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          debugger
          alert("Your reference number is: " + response.data.reference_number);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getReservationDetails() {
      const url = "/apinew/getReservationDetails/";
      var form = new FormData();
      form.append("post_id", this.postId);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          response.data.reservations.forEach((reservation) => {
            reservation.date_list.forEach((dates) => {
              const dateObj = new Date(dates);
              this.disabledDates.dates.push(dateObj);
            });
          });
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getPostView() {
      const url = "/apinew/postView/";
      var form = new FormData();
      form.append("post_id", this.postId);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            this.post = response.data.post;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  mounted() {
    this.getReservationDetails();
    this.getPostView();
  },
};
</script>
