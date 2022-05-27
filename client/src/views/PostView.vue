<template>
  <div v-if="post" class="container pt-5">
    <div class="row">
      <div class="col-md-5">
        <div class="row">
          <div class="col-12">
            <div class="row mb-3" v-if="post.images && post.images.length > 0">
              <div
                class="col-2 position-relative"
                v-for="image in post.images"
                :key="image.id"
              >
                <img
                  class="img-thumbnail shadow-sm w-100 cursor-pointer"
                  @click="selectImage(image)"
                  img
                  :src="`http://localhost/easyrentnew/apinew/uploads/items/${image.name}`"
                />
              </div>
            </div>
            <div class="w-100 form-group">
              <div class="card p-4 shadow-sm">
                <img
                  :src="
                    selectedImage
                      ? `http://localhost/easyrentnew/apinew/uploads/items/${selectedImage.name}`
                      : require('./../assets/images/No_Image_Available.jpg')
                  "
                  class="img-fluid"
                  alt="Responsive image"
                />
              </div>
            </div>
          </div>
        </div>
        <!-- <img
          :src="
            post.img
              ? `http://localhost/easyrentnew/apinew/uploads/items/${post.img}`
              : require('./../assets/images/No_Image_Available.jpg')
          "
          class="img-fluid"
          alt="Responsive image"
        /> -->
      </div>
      <div class="col-md-6">
        <div class="row">
          <div class="col-12">
            <h4 class="mb-4">{{ post.post_title }}</h4>
            <h5 class="text-left">
              Rs. {{ finalPrice
              }}<small class="ml-2">{{
                post.rent_type_id === 1 ? "Per Day" : "Per Duration"
              }}</small>
            </h5>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="form-group">
              <star-rating
                :read-only="true"
                :star-size="24"
                :rating="post.avg_rate"
                :show-rating="false"
              ></star-rating>
            </div>
            <div class="w-100 mt-4">
              <p class="mb-0">When do you want to rent it ?</p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="datetimepicker6">From</label>
              <datepicker
                :lowerLimit="minimumFromDate"
                :upperLimit="maximumFromDate"
                v-model="fromDate"
                :disabledDates="disabledDates"
                :disabled="post.available !== 1"
              />
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="datetimepicker6">To</label>
              <datepicker
                :lowerLimit="minimumToDate"
                v-model="toDate"
                :disabledDates="disabledDates"
                :disabled="post.available !== 1"
              />
            </div>
          </div>
          <div class="col-12">
            <h5>
              <span
                v-if="post.available === 1"
                class="badge badge-success mt-3"
                :class="stateClass"
                >Available</span
              >
              <span
                v-else
                class="badge badge-secondary mt-3"
                :class="stateClass"
                >Unavailable</span
              >
            </h5>
          </div>
          <div class="col-md-12">
            <p class="mt-3">
              Owned by
              <strong>{{ post.firstname }} {{ post.lastname }}</strong>
            </p>
            <div class="row">
              <div class="col-md-12">
                <button
                  type="button"
                  class="btn btn-danger"
                  @click="clickReserve"
                  :disabled="post.available !== 1 || !(this.fromDate && this.toDate)"
                >
                  Request reserve
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="row"></div>
        </div>
        <!-- <div class="row" v-else>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="form-label" for="datetimepicker6">From</label>
                <datepicker v-model="fromDate" :disabled="true" />
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="form-label" for="datetimepicker6">To</label>
                <datepicker v-model="toDate" :disabled="true" />
              </div>
            </div>
          </div>
          <div class="w-100">
            <h5>
              <span class="badge badge-secondary mt-3" :class="stateClass"
                >Unavailable</span
              >
            </h5>
          </div>
          <div class="row">
            <div class="col-md-12">
              <p class="mt-3 mb-1">
                Owned by
                <strong>{{ post.firstname }} {{ post.lastname }}</strong>
              </p>
              <button
                type="button"
                class="btn btn-danger col-md-12"
                @click="clickReserve"
                :disabled="true"
              >
                Request reserve
              </button>
            </div>
          </div>
        </div> -->
      </div>
    </div>
    <nav>
      <div class="nav nav-tabs mt-4" id="nav-tab" role="tablist">
        <button
          class="nav-link"
          :class="{ active: selectedTabId === 1 }"
          type="button"
          @click="selectedTabId = 1"
        >
          Reviews
        </button>
        <button
          class="nav-link"
          :class="{ active: selectedTabId === 2 }"
          type="button"
          @click="selectedTabId = 2"
        >
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
        <reviews :postId="postId" />
      </div>
      <div
        v-else
        class="tab-pane fade show active mt-3 mb-4"
        id="nav-profile"
        role="tabpanel"
        aria-labelledby="nav-profile-tab"
      >
        <description :postId="postId" />
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
      selectedImage: null,
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
    description,
  },
  computed: {
    maximumFromDate() {
      const getTodaydate = moment(this.toDate);
      const getFormattedDate = getTodaydate.format("YYYY-MM-DD");
      return new Date(getFormattedDate);
    },
    minimumFromDate() {
      const getTodaydate = moment();
      const getTomorrowDate = getTodaydate.add(1, "days");
      const getFormattedDate = getTomorrowDate.format("YYYY-MM-DD");
      return new Date(getFormattedDate);
    },
    minimumToDate() {
      const getTodaydate = moment();
      const getTomorrowDate = getTodaydate.add(1, "days");
      const fromDate = this.fromDate ? moment(this.fromDate) : getTomorrowDate;
      const getToFormattedDate = fromDate.format("YYYY-MM-DD");
      return new Date(getToFormattedDate);
    },
    postId() {
      return parseInt(this.$route.params.post_id);
    },
    daysLength() {
      const fromDate = moment(this.fromDate, "YYYY-MM-DD");
      const toDate = moment(this.toDate, "YYYY-MM-DD");
      let difference = 1
      if (this.fromDate && this.toDate) {
        const diff = moment.duration(toDate.diff(fromDate)).asDays()
        const diffAdded = diff + 1;
        difference = diffAdded;
      }
      return difference;
    },
    finalPrice() {
      return this.post.price * this.daysLength;
    },
  },
  methods: {
    clickReserve() {
      if (this.user) {
        const url = "/apinew/makeReservation/";
        var form = new FormData();
        const formattedFromDate = moment(this.fromDate).format("YYYY-MM-DD");
        const formattedToDate = moment(this.toDate).format("YYYY-MM-DD");
        form.append("tenant_id", this.user.user_id);
        form.append("from_date", formattedFromDate);
        form.append("to_date", formattedToDate);
        form.append("post_id", this.postId);
        form.append("finalPrice", this.finalPrice);
        // if (this.user.user_id === this.post.user_id) {
        //   this.$toast.error("You cannot reserve your own item");
        // } 
        axios({
          method: "post",
          url: url,
          data: form,
        })
          .then((response) => {
            alert(
              "Your reference number is: " + response.data.reference_number
            );
            // this.$router.push({ path: "/" });
          })
          .catch((error) => {
            console.error(error);
          });
      } else {
        this.$toast.error("Please log in before reserve an item");
        this.$router.push({ path: "/login" });
      }
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
            this.post.images = [];
            this.post.images = response.data.images;
            if (response.data.images && response.data.images.length > 0) {
              this.selectedImage = response.data.images[0];
            }
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    selectImage(image) {
      this.selectedImage = image;
    },
  },
  mounted() {
    this.getReservationDetails();
    this.getPostView();
  },
};
</script>
