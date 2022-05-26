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
                  type="password"
                  class="form-control"
                  placeholder="john"
                  v-model="password"
                />
              </div>
              <div class="form-check col-md-6 ml-3">
                <input
                  type="checkbox"
                  class="form-check-input"
                  v-model="isRememberMe"
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
import axios from "axios";
import Cookies from "js-cookie";
export default {
  data() {
    return {
      username: "",
      password: "",
      isRememberMe: false,
    };
  },
  methods: {
    loginUser() {
      let url = "/apinew/login/";
      var form = new FormData();
      form.append("username", this.username);
      form.append("password", this.password);
      debugger
      if (this.username.trim() == "") {
        this.$toast.error("Username is required");
      } else if (this.password.trim() == "") {
        this.$toast.error("Password is required");
      } else {
        axios({
          method: "post",
          url: url,
          data: form,
        })
          .then((response) => {
            this.getUserDetails(response.data.token);
            this.$toast.success(response.data.message);
          })
          .catch((error) => {
            this.$toast.error(error.response.data.message);
          });
      }
    },
    getUserDetails(token) {
      let url = "/apinew/getUser/";
      var form = new FormData();
      form.append("token", token);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            const userString = JSON.stringify(response.data.user);
            if (this.isRememberMe) {
              Cookies.set("token", token, { expires: 30 });
              Cookies.set("user", userString, { expires: 30 });
            } else {
              Cookies.set("token", token);
              Cookies.set("user", userString);
            }
            debugger;
            this.$router.push({ path: "/" });
            setTimeout(() => {
              document.location.reload(true);
            }, 1000);
          }
        })
        .catch((error) => {
          console.error(error);
          this.$toast.error("Incorrect username or password");
        });
    },
  },
  mounted() {
    if (this.user) {
      this.$router.push({ path: "/" });
    }
  },
};
</script>