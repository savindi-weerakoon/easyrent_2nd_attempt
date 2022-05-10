<template>
  <div class = "container pt-5">
    <div class="profile">
      <div class="row">
        <div class="col-6 col-lg-3 col-sm-3 mb-3">
          <img :src="user.profile_image ? `http://localhost/easyrentnew/apinew/uploads/profile/${user.profile_image}` : require('./../assets/images/avatar.png')" class="card-img-top">
          <div class="custom-file">
          <input type="file" class="custom-file-input" id="inputGroupFile01" @change="uploadProfile($event)" accept=".jpg, .jpeg, .png">
          <label class="custom-file-label" for="inputGroupFile01">Click to select profile picture</label>
        </div>
        </div>
        <div class="col-9 col-lg-9 col-sm-6 mb-3">
          <div class="row">
          <div class="form-group col-md-6">
            <label>Firstname</label>
            <input type = "text" class="form-control" placeholder="john" v-model="firstname"/>
          </div>
          <div class="form-group col-md-6">
            <label>Lastname</label>
            <input type = "text" class="form-control" placeholder="john" v-model="lastname"/>
          </div>
          </div>
          <div class="row">
          <div class="form-group col-md-6">
            <label>Username</label>
            <input type = "text" class="form-control" placeholder="john" v-model="username" disabled/>
          </div>
          <div class="form-group col-md-6">
            <label>Email</label>
            <input type = "text" class="form-control" placeholder="john" v-model="email"/>
          </div>
          </div>
          <div class="row">
          <div class="form-group col-md-6">
            <label>Contact Number</label>
            <input type = "text" class="form-control" placeholder="john" v-model="contactnumber"/>
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
export default {
  data() {
    return {
      image_id: null,
      firstname:'',
      lastname:'',
      username:'',
      email:'',
      contactnumber:''
    }
  },
  props: {
    user: {
      type: Object,
    }
  },
  methods: {
    updateUser() {
      let url = "/apinew/updateUser/";
      var form = new FormData();
      form.append("image_id", this.image_id);
      form.append("firstname", this.firstname);
      form.append("lastname", this.lastname);
      form.append("username", this.username);
      form.append("email", this.email);
      form.append("contact_number", this.contactnumber);
      axios({
        method: "post",
        url: url,
        data: form,
      })
        .then((response) => {
          this.$router.push({ path: "/" });
          console.log(response);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    uploadProfile(event) {
      debugger
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
            debugger
            // this.user['profile_image'] = response.data.data.name
            // this.user['profile_image'] = response.data.data.name
            this.image_id = response.data.data.id;
          }
        })
        .catch((error) => {
          debugger
          console.error(error);
        });
    },
  },
}
</script>
      

