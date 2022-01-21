<template>
  <div class="container pt-5">
    <div class="row">
      <div class="col-md-7">
        <h2>Cannon S20 Digital Camera</h2>
        <img
          class="card-img-top"
          src="./../../assets/images/image_02.jpg"
          alt="Card image cap"
        />
      </div>
      <div class="col-md-5 mt-5">
        <h6 class="text-left">Cannon</h6>
        <h5 class="text-left">Digital Camera</h5>
        <div class="row">
        <h3 class="text-left mt-4 ml-3">Rs.1200/=</h3><small class="mt-5">per day</small>
        </div>
        <h5 class="text-left mt-4">Choose</h5>
        <div class="row">
          <div class="col-md-4 mt-2">
            <div class="button text-center">
              <button
                type="button"
                class="btn btn-outline-primary"
                @click="checkUsernameValidity"
              >
                Start Date
              </button>
            </div>
          </div>
          <div class="col-md-4 mt-2">
            <div class="button text-center">
              <button
                type="button"
                class="btn btn-outline-primary"
                @click="checkUsernameValidity"
              >
                End Date
              </button>
            </div>
          </div>
        </div>
        <h6 class="mt-5">Total Amount to Pay ............</h6>
        <div class="row">
        <div class="button mt-3 col-md-8 pt-1">
              <button
                type="button"
                class="btn btn-danger"
                @click="checkUsernameValidity"
              >
                Add to Cart
              </button>
            </div>
        </div>
      </div>
    </div>
    <nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Description</button>
    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Delivery</button>
    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">FAQ's</button>
    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Circularity</button>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active mt-3" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">This is a high quality, sustainable cannon camera </div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
</div>
  </div>
</template>