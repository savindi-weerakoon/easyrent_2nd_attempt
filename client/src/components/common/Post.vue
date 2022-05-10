<template>
  <div v-if="post" class="post pt-5">
    <div class="card ml-3" style="width: 18rem">
      <img
        class="card-img-top"
        :src="`http://localhost/easyrentnew/apinew/uploads/items/${post.img}`"
        alt="Card image cap"
      />
      <hr />
      <div class="card-body pt-1">
        <h5 class="card-title d-flex align-items-center">{{post.post_title}}</h5>
        <div class="d-flex w-100">
            <vue-material-icon name="favorite" :size="32"></vue-material-icon>
            <span class="d-flex align-items-center ml-2">({{post.avg_rate}})</span>
          </div>
        <p class="card-text">
          {{post.content}}
        </p>
        <div class="badge badge-warning d-flex align-items-center col-md-3">
          <h8>{{post.rent_type_id === 1 ? 'per day' : 'per duration'}}</h8>
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
            >Rs.{{post.price}}/=</span
          ><br />
        </h4>
        <p class="mb-0 mt-1 d-flex align-items-center">
          <small>By {{post.firstname}} {{post.lastname}}</small>
        </p>
        <p class="mb-0 d-flex align-items-center">
          <small><em>{{post.city}}, {{post.district}}</em></small>
        </p>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: "Post",
  components: {
  },
  props: {
    post: {
      type: Object
    }
  }
}
</script>