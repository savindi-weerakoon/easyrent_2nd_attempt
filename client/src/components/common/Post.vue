<template>
  <div v-if="post" class="post pt-3">
    <router-link :to="`/postView/${post.post_id}`">
      <div class="card ml-3">
        <div
          v-if="post.img"
          class="post-image-container shadow-sm"
          :style="`background-image: url(http://localhost/easyrentnew/apinew/uploads/items/${post.img}`"
        ></div>
        <div
          v-else
          class="post-image-container shadow-sm"
          :style="`background-image: url(${require('./../../assets/images/No_Image_Available.jpg')}`"
        ></div>
        <div class="card-body mt-1">
          <h6 class="card-title mb-1 d-flex align-items-center">
            {{ post.post_title }}
          </h6>
          <div class="form-group">
          <star-rating :read-only="true" :star-size="24" :rating="post.avg_rate" :show-rating="false"></star-rating>
        </div>
          <!-- <div class="d-flex w-100">
            <vue-material-icon name="favorite" :size="32"></vue-material-icon>
            <span class="d-flex align-items-center ml-2" v-if="post.avg_rate"
              >({{ post.avg_rate }})</span
            >
          </div> -->
          <p class="card-text">
            {{ post.content }}
          </p>
          <div class="badge badge-warning py-2 px-2">
            <span>{{ post.rent_type_id === 1 ? "Per Day" : "Per Duration" }}</span>
          </div>
          <h4>
            <span
              class="
                badge badge-success
                text-center
                mt-2
                d-flex
                align-items-center
              "
              style="width: 120px; height: 30px"
            >
              Rs.{{ post.price }}/=
            </span>
          </h4>
          <p class="mb-0 mt-1 d-flex align-items-center">
            <small>By {{ post.firstname }} {{ post.lastname }}</small>
          </p>
          <p class="mb-0 d-flex align-items-center">
            <small
              ><em>{{ post.city }}, {{ post.district }}</em></small
            >
          </p>
        </div>
      </div>
    </router-link>
  </div>
</template>

<script>
import StarRating from "vue-star-rating";
export default {
  name: "Post",
  components: {
    StarRating,
  },
  props: {
    post: {
      type: Object,
    },
  },
};
</script>

<style lang="scss" scoped>
.post-image-container {
  width: 100%;
  height: 250px;
  background-position: center;
  background-size: cover;
  background-repeat: no-repeat;
}
</style>