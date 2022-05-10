<template>
  <div class="container pt-5">
    <div class="row">
      <div class="col-md-7">
        <img
          class="card-img-top"
          src="./../assets/images/image_02.jpg"
          alt="Card image cap"
        />
      </div>
      <div class="col-md-5 mt-5">
        <h4>Cannon S20 Digital Camera</h4>
        <div class="row">
          <h6 class="text-left mt-4 ml-3 mb-3">
            Rs.1200/=<small class="mt-5 ml-2">per day</small>
          </h6>
        </div>
        <div class="form-group">
          <star-rating :star-size="24"></star-rating>
        </div>
        <div class="w-100">
          <p class="mb-0">When do you want to rent it ?</p>
        </div>
        <!-- <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label class="form-label" for="datetimepicker6">From</label>
                <div class="input-group date" id="datetimepicker6">
                  <datepicker>1</datepicker>
                  <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                  </span>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label class="form-label" for="datetimepicker7">To</label>
                <div class="input-group date" id="datetimepicker7">
                  <datepicker>2</datepicker>
                  <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                  </span>
                </div>
              </div>
            </div>
          </div> -->
        <div class="row">
          <div class="col-md-6 mt-2">
            <div class="form-group">
              <label class="form-label" for="datetimepicker6">From</label>
              <datepicker v-model="date" :disabledDates="disabledDates" />
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="datetimepicker6">To</label>
              <datepicker v-model="date" :disabledDates="disabledDates" />
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
            <p class="mt-3 mb-1">Owned by <strong>Amal Perera</strong></p>
            <button type="button" class="btn btn-danger col-md-12">
              Request reserve
            </button>
          </div>
        </div>
      </div>
    </div>
    <nav>
      <div class="nav nav-tabs mt-4" id="nav-tab" role="tablist">
        <button
          class="nav-link active"
          id="nav-home-tab"
          data-bs-toggle="tab"
          data-bs-target="#nav-home"
          type="button"
          role="tab"
          aria-controls="nav-home"
          aria-selected="true"
        >
          Reviews
        </button>
        <button
          class="nav-link"
          id="nav-profile-tab"
          data-bs-toggle="tab"
          data-bs-target="#nav-profile"
          type="button"
          role="tab"
          aria-controls="nav-profile"
          aria-selected="false"
        >
          Description
        </button>
      </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
      <div
        class="tab-pane fade show active mt-3"
        id="nav-home"
        role="tabpanel"
        aria-labelledby="nav-home-tab"
      >
        This is a high quality, sustainable cannon camera
      </div>
      <div
        class="tab-pane fade"
        id="nav-profile"
        role="tabpanel"
        aria-labelledby="nav-profile-tab"
      >
        ...
      </div>
    </div>
  </div>
</template>
<script>
import StarRating from "vue-star-rating";
import moment from "moment";
import Datepicker from "vue3-datepicker";
export default {
  name: "ViewPosts",
  data() {
    return {
      date: moment(),
      disabledDates: [new Date()],
    };
  },
  components: {
    StarRating,
    Datepicker,
  },
  computed: {},
  methods: {},
};
</script>


