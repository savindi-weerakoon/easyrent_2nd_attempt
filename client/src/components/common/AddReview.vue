<template>
  <div class="row justify-content-center">
    <div class="col-12">
      <h5 class="mb-2">Camera</h5>
      <form>
        <div class="form-group mb-2">
          <star-rating :star-size="24" :show-rating="false"></star-rating>
        </div>
        <div class="form-group mb-2">
          <p class="mb-1" for="desc">This is good</p>
          <div class="suggetions mb-2">
            <span class="badge badge-pill badge-secondary mr-1" role="button" v-for="(suggetion, index) in suggetions" :key="index" @click="quickPick(suggetion)">{{suggetion}}</span>
          </div>
          <textarea class="form-control" id="desc" rows="4">this is ttt</textarea>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import StarRating from "vue-star-rating";
export default {
  name: 'add-review',
  components: {
    StarRating,
  },
}
</script>