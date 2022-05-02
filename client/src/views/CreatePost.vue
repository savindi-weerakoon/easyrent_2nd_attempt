<template>
  <div class="container py-5"></div>
  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="form-group">
        <label>Select Province</label>
        <select class="form-control">
          <option>Western</option>
        </select>
      </div>
      <div class="form-group">
        <label>Select District</label>
        <select class="form-control">
          <option>Kaluthara</option>
        </select>
      </div>
      <div class="form-group">
        <label>Select City</label>
        <select class="form-control">
          <option>Colombo</option>
        </select>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="row">
        <div class="col-12">
          <div class="form-group full-width">
            <label>Item Name </label>
            <input class="form-control" placeholder="Canon 123" />
          </div>
        </div>
      </div>
      <hr class="mb-1"/>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6">
        <div class="row">
          <div class="col-12">
            <div class="form-group full-width">
              <label>Item Images </label>
              <img
                class="img-fluid shadow-sm w-100"
                img
                src="./../assets/images/image_02.jpg"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12 input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">Upload</span>
        </div>
        <div class="custom-file">
          <input type="file" class="custom-file-input" id="inputGroupFile01" />
          <label class="custom-file-label" for="inputGroupFile01"
            >Click to select images</label
          >
        </div>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-md-12 col-lg-6">
      <div class="form-group full-width">
        <label>Description</label>
        <textarea class="form-control" style="min-height:200px;" placeholder="This is a cannon camera"></textarea>
          <hr class="mb-1"/>
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-md-6 col-lg-3">
      <label>Rent Type</label>
      <div class="form-group ">
        <select class="form-control">
          <option>Per Day</option>
          <option>One Time</option>
        </select>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <label>Rent Price</label>
      <div class="row">
      <input class="form-control" type="number" placeholder="1500">
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
      <div class="col-md-12 col-lg-6">
        <label>Contact Numbers</label>
        <div class="col-md-12 col-lg-6">
          <vue-fontawesome icon="mobile-phone" color="#28a745"></vue-fontawesome>
          <div class="col-md-12 col-lg-6">0776789900</div>
        </div>
        <hr class="mb-1"/>
        <div class="col-md-12 col-lg-6">
          <vue-fontawesome icon="mobile-phone" color="#28a745"></vue-fontawesome>
          <div class="col-md-12 col-lg-6">0346789900</div>
        </div>
        <hr class="mb-1"/>
        <hr class="mb-1"/>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-12 col-lg-6">
        <label>Item Owner</label>
        <div class="form-group full-width">
          <p>By <strong>Amal Perera</strong></p>
        </div>
      </div>
    </div>
    <div class="row">
          <div class="col-md-12 col-lg-9">
            <div class="full-width d-flex justify-content-end">
              <button type="button" class="btn btn-light mr-3">Cancel</button>
              <button type="button" class="btn btn-success" @click="publish">Publish</button>
            </div>
          </div>
        </div>
</template>