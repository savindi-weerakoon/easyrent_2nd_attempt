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
                <small class="text-danger">{{ validation.username }}</small>
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
                  v-model="firstname"
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
              <div v-if="passwordMsg">
                <div v-if="passwordMatching" class ="text-danger ml-3"><small>Looks Good</small></div>
                <div v-else class ="text-danger ml-3"><small>Confirmation password is not matching</small></div>
              </div>
              <div class="form-group col-md-12 mt-3 mb-3">
                <button
                  type="button"
                  class="btn btn-primary form-control"
                  @click="userExist"
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

<script>
import axios from 'axios'
export default {
  name: 'register',
  data () {
    return {
      username: '',
      firstname: '',
      lastname: '',
      email: '',
      telephone: '',
      mobile: '',
      password: '',
      confirm_password: '',
      validation: {
        username: null
      }
    }
  },
  computed: {
    passwordMsg() {
      let state = false;
      if (this.password !== null && this.confirm_password !== null) {
        if (this.password.trim() !== '' && this.confirm_password !== '' ){
          state = true
        }
        else {
          state = false
        }
      }
      return state
    },

    passwordMatching () {
      let state = true;
      if (this.password !== null && this.confirm_password !== null) {
        if (this.password.trim() !== '' && this.confirm_password !== '' ) {
          if (this.password === this.confirm_password) {
            state = true
          } else {
            state = false
          }
        } 
        // else {
        //   state = true
        // }
      }
      return state 
    },
  },
  methods: {
    makeRegister() {
      if (!this.passwordMatching) {
        alert('Password not matching');
      } else {
        let url = '/apinew/register/'
        var form = new FormData();
        form.append('username', this.username);
        form.append('firstname', this.firstname);
        form.append('lastname', this.lastname);
        form.append('email', this.email);
        form.append('telephone', this.telephone);
        form.append('mobile', this.mobile);
        form.append('password', this.confirm_password);
        axios({
          method: 'post',
          url: url,
          data: form,
        })
        .then(response => {
          console.log(response)
        })
        .catch(error => {
          console.error(error)
        })
      }
    },
    userExist(){
      let url = '/apinew/UserExist/'
      var form = new FormData();
      form.append('username', this.username);
      axios({
        method: 'post',
        url:url,
        data:form,
      }) 
      .then(response => {
        var usercount = parseInt(response.data)
        if (usercount == 0){
          this.makeRegister()
        }
        else {
          this.validation.username = "User already exist";
        }
        console.log(response)
      })
      .catch(error => {
        console.error(error)
      })  
    }
  }  
}
</script>