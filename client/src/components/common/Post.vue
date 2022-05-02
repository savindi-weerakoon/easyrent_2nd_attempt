<template>
  <div class="post pt-5">
    <div class="card ml-3" style="width: 18rem">
      <img
        class="card-img-top"
        src="./../../assets/images/image_02.jpg"
        alt="Card image cap"
      />
      <hr />
      <div class="card-body pt-1">
        <h5 class="card-title d-flex align-items-center">Canon Camera</h5>
        <p class="card-text">
          This is a high quality canon camera with high quality features.
        </p>
        <div class="badge badge-warning d-flex align-items-center col-md-3">
          <h8>Per Day</h8>
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
            >Rs.10750/=</span
          ><br />
        </h4>
        <p class="mb-0 mt-1 d-flex align-items-center">
          <small>By Amal Perera</small>
        </p>
        <p class="mb-0 d-flex align-items-center">
          <small><em>Horana, Kaluthara</em></small>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Post",
}
</script>