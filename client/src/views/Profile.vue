<template>
  <div class="container pt-5" v-if="profile">
    <div class="profile">
      <div class="row">
        <div class="col-6 col-lg-3 col-sm-3 mb-3">
          <img :src="profile && profile.image_name ? `http://localhost/easyrentnew/apinew/uploads/profile/${profile.image_name}` : require('./../assets/images/avatar.png')" class="card-img-top">
          <div class="custom-file">
          <input type="file" class="custom-file-input" id="inputGroupFile01" @change="uploadProfile($event)" accept=".jpg, .jpeg, .png">
          <label class="custom-file-label" for="inputGroupFile01">Click to select profile picture</label>
        </div>
        </div>
        <div class="col-9 col-lg-9 col-sm-6 mb-3">
          <div class="row">
          <div class="form-group col-md-6">
            <label>Firstname</label>
            <input type = "text" class="form-control" placeholder="john" v-model="profile.firstname"/>
          </div>
          <div class="form-group col-md-6">
            <label>Lastname</label>
            <input type = "text" class="form-control" placeholder="john" v-model="profile.lastname"/>
          </div>
          </div>
          <div class="row">
          <div class="form-group col-md-6">
            <label>Username</label>
            <input type = "text" class="form-control" placeholder="john" v-model="profile.username" disabled/>
          </div>
          <div class="form-group col-md-6">
            <label>Email</label>
            <input type = "text" class="form-control" placeholder="john" v-model="profile.email"/>
          </div>
          </div>
          <div class="row">
          <div class="form-group col-md-6">
            <label>Contact Number</label>
            <input type = "text" class="form-control" placeholder="john" v-model="profile.phone"/>
          </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="w-100 d-flex justify-content-end">
                <div class="form-group col-md-3 mt-3 mb-3">
                <button
                  type="button"
                  class="btn btn-secondary form-control" @click="$router.go(-1)"
                >
                  Cancel &amp; go back
                </button>
              </div>
              <div class="form-group col-md-2 mt-3 mb-3">
                <button
                  type="button"
                  class="btn btn-success form-control" @click="updateUser"
                >
                  Update
                </button>
              </div>
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
      profile: null,
    }
  },
  methods: {
    updateUser() {
      let url = "/apinew/updateUser/";
      var form = new FormData();
      form.append("image_id", this.profile.image_id);
      form.append("user_id", this.profile.user_id);
      form.append("firstname", this.profile.firstname);
      form.append("lastname", this.profile.lastname);
      form.append("username", this.profile.username);
      form.append("email", this.profile.email);
      form.append("contact_number", this.profile.phone);
      if (this.profile.firstname === null || this.profile.firstname.trim() === '') {
        this.$toast.error('You cannot keep firstname empty');
      } else if (this.profile.lastname === null || this.profile.lastname.trim() === '') {
        this.$toast.error('You cannot keep lastname empty');
      } else if (this.profile.email === null || this.profile.email.trim() === '') {
        this.$toast.error('You cannot keep email empty');
      // } else if (this.user.contact_numbers === null || this.user.contact_numbers.trim() === '') {
      //   alert('You cannot keep contact numbers empty');
      } else {
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.$toast.success('You have successfully updated your profile')
          this.$router.push({ path: "/" });
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
      }
    },
    uploadProfile(event) {
      var formData = new FormData();
      formData.append("image", event.target.files[0]);
      axios
        .post("/apinew/uploadProfilePic/", formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
        .then((response) => {
          if (response.status === 200) {
            this.profile.image_id = response.data.data.id;
            this.profile.image_name = response.data.data.name;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getProfile() {
      const url = "/apinew/getUser/";
      var form = new FormData();
      const token = Cookies.get("token");
      form.append("token", token);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          if (response.status === 200) {
            this.profile = response.data.user;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  mounted() {
    this.getProfile();
  },
}
</script>
      

