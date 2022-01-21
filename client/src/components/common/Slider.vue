<template>
  <div class ="Slider">
    <div class = "jumbotron banner-image ">
    <h1 class="text-white mt-5 ml-4">Rent <br/> Whatever You Want !</h1>
    <h3 class = "text-center text-white mt-4">Convenient Access to Anything</h3>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.banner-image {
  background-image: url("./../../assets/images/image_01.jpg");
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  background-repeat: no-repeat;
}
</style>

<script>
export default {
  name: "slider",
};
</script>