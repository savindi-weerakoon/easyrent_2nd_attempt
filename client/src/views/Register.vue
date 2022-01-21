<template>
  <div class="register pt-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 offset-lg-3 col-sm-8 offset-sm-2">
          <div class="card bg-light">
            <div class="card-body row">
              <h4 class="card-title col-12 text-center mb-3 mt-3">Register</h4>
              <div class="form-group col-md-6">
                <label for="validationServer01 text-danger"
                  >Username<span class="text-danger"
                    ><small>* (required)</small></span
                  >
                </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="john"
                  v-model="username"
                />
              </div>
              <div class="form-group col-md-6">
                <label for="validationServer01 text-danger"
                  >Firstname<span class="text-danger"
                    ><small>* (required)</small></span
                  >
                </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="john"
                  v-model="firtname"
                />
              </div>
              <div class="form-group col-md-6">
                <label for="validationServer01 text-danger"
                  >Lastname<span class="text-danger"
                    ><small>* (required)</small></span
                  >
                </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="doe"
                  v-model="lastname"
                />
              </div>
              <div class="form-group col-md-6">
                <label for="validationServer01 text-danger"
                  >Email<span class="text-danger"
                    ><small>* (required)</small></span
                  >
                </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="john.doe@gmail.com"
                  v-model="email"
                />
              </div>
              <div class="form-group col-md-6">
                <label for="validationServer01 text-danger"
                  >Telephone<span class="text-danger"
                    ><small>* (required)</small></span
                  >
                </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="01122222"
                  v-model="telephone"
                />
              </div>
              <div class="form-group col-md-6">
                <label for="validationServer01 text-danger"
                  >Mobile<span class="text-danger"
                    ><small>* (required)</small></span
                  >
                </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="01122222"
                  v-model="mobile"
                />
              </div>
              <div class="form-group col-md-6">
                <label for="validationServer01 text-danger"
                  >Password<span class="text-danger"
                    ><small>* (required)</small></span
                  >
                </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="john.doe"
                  v-model="password"
                />
              </div>
              <div class="form-group col-md-6">
                <label for="validationServer01 text-danger"
                  >Confirm Password<span class="text-danger"
                    ><small>* (required)</small></span
                  >
                </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="john.doe"
                  v-model="confirm_password"
                />
              </div>
              <div class="form-group col-md-12 mt-3 mb-3">
                <button
                  type="button"
                  class="btn btn-primary form-control"
                  @click="checkUsernameValidity"
                >
                  Register
                </button>
              </div>
              <div class="form-group col-md-12 mb-3">
                <router-link cls to="/login"
                  ><small>Already have an account?, Login</small></router-link
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
