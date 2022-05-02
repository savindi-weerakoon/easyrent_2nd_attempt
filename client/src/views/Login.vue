<template>
  <div class="login pt-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 offset-lg-4 col-sm-8 offset-sm-3">
          <div class="card bg-light">
            <div class="card-body row">
              <h4 class="card-title col-12 text-center">Login</h4>
              <div class="form-group col-md-12">
                <label for="validationServer01 text-danger">Username </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="john"
                  v-model="username"
                />
              </div>
              <div class="form-group col-md-12">
                <label for="validationServer01 text-danger">Password </label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="john"
                  v-model="password"
                />
              </div>
              <div class="form-check col-md-6 ml-3">
                <input
                  type="checkbox"
                  class="form-check-input"
                  v-model="checkbox"
                />
                <label class="form-check-label" for="exampleCheck1"
                  >Remember Me</label
                >
              </div>
              <div class="form-group col-md-12 mt-3 mb-3">
                <button
                  type="button"
                  class="btn btn-primary form-control"
                  @click="loginUser"
                >
                  Login
                </button>
              </div>
              <div class="form-group col-md-12">
                <router-link cls to="/register"
                  ><small
                    >Don't have an account?, Register Now</small
                  ></router-link
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  data() {
    return {
      username: '',
      password: '',
      checkbox: false
    }
  },
  methods: {
    loginUser() {
      let url = '/apinew/login/'
      var form = new FormData();
      form.append('username', this.username);
      form.append('password', this.password);
      axios({
          method: 'post',
          url: url,
          data: form,
        })
        .then(response => {
          this.$router.push({path: '/'})
          console.log(response)
        })
        .catch(error => {
          console.error(error)
        })
    }
  }
}
</script>