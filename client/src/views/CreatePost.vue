<template>
  <div class="container py-4">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="row">
          <label class="col-12">Select Category</label>
          <div
            class="form-group col-lg-4 col-md-6"
            v-for="(categoryItem, level) in categoriesList"
            :key="level"
          >
            <select
              v-if="categoryItem.categories.length > 0"
              @change="
                getCategories(categoryItem.categories.selectedCatId, level)
              "
              v-model="categoryItem.categories.selectedCatId"
              class="form-control"
            >
              <option
                v-for="category in categoryItem.categories"
                :key="category.category_id"
                :value="{
                  cat: category,
                  level: level,
                }"
              >
                {{ category.category_name }}
              </option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="form-group">
              <label>Select Province</label>
              <select
                class="form-control"
                v-model="form.selectedProvinceId"
                @change="getDistricts"
              >
                <option
                  v-for="province in provinces"
                  :key="province.id"
                  :value="province.id"
                >
                  {{ province.province }}
                </option>
              </select>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div v-if="districts.length > 0" class="form-group">
              <label>Select District</label>
              <select
                class="form-control"
                v-model="form.selectedDistrictId"
                @change="getCities"
              >
                <option
                  v-for="district in districts"
                  :key="district.id"
                  :value="district.id"
                >
                  {{ district.district }}
                </option>
              </select>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div v-if="cities.length > 0" class="form-group">
              <label>Select City</label>
              <select class="form-control" v-model="form.selectedCityId">
                <option v-for="city in cities" :key="city.id" :value="city.id">
                  {{ city.city }}
                </option>
              </select>
            </div>
          </div>
        </div>
        <div v-if="isEndCategory && form.selectedCityId">
          <div class="row">
            <div class="col-12">
              <div class="form-group full-width">
                <label>Item Name </label>
                <input
                  class="form-control"
                  placeholder="Canon 123"
                  v-model="form.itemName"
                />
              </div>
            </div>
          </div>
          <hr class="mb-1" />
          <div class="row">
            <div class="col-12">
              <div class="w-100 form-group">
                <div
                  class="shadow-sm main-image"
                  :style="
                    form.selectedImage
                      ? `background-image: url(http://localhost/easyrentnew/apinew/uploads/items/${form.selectedImage.name})`
                      : `background-image: url(${require('./../assets/images/No_Image_Available.jpg')})`
                  "
                ></div>
              </div>
              <div class="row mb-3">
                <div
                  class="col-2 position-relative"
                  v-for="image in form.images"
                  :key="image.id"
                >
                  <img
                    class="img-thumbnail shadow-sm w-100 cursor-pointer"
                    @click="selectImage(image)"
                    img
                    :src="`http://localhost/easyrentnew/apinew/uploads/items/${image.name}`"
                  />
                  <!-- <pre>{{image}}</pre> -->
                  <span
                    class="badge badge-danger position-absolute cursor-pointer"
                    style="top: 0; right: 0"
                    @click="removeImage(image.id)"
                    >x</span
                  >
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
                <input
                  type="file"
                  class="custom-file-input"
                  id="inputGroupFile01"
                  @change="uploadImage($event)"
                />
                <label class="custom-file-label" for="inputGroupFile01"
                  >Click to select images</label
                >
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="form-group full-width">
                <label>Description</label>
                <textarea
                  class="form-control"
                  style="min-height: 200px"
                  placeholder="This is a cannon camera"
                  v-model="form.description"
                ></textarea>
                <hr class="mb-1" />
              </div>
            </div>
          </div>
          <div class="row">
            <!-- <div class="col-md-6">
              <div class="form-group">
                <label>Rent Type</label>
                <select class="form-control" v-model="form.rentType">
                  <option
                    v-for="rentType in rentTypes"
                    :key="rentType.rent_type_id"
                    :value="rentType.rent_type_id"
                  >
                    {{ rentType.rent_type }}
                  </option>
                </select>
              </div>
            </div> -->
            <div class="col-md-6">
              <div class="form-group">
                <label>Rent Price</label>
                <input
                  class="form-control"
                  type="number"
                  placeholder="1500"
                  v-model="form.price"
                />
              </div>
            </div>
          </div>
          <div class="row mb-3">
            <div class="col-md-12">
              <label>Contact Number</label>
              <div class="col-md-12">
                <vue-fontawesome
                  icon="mobile-phone"
                  color="#28a745"
                ></vue-fontawesome>
                <div class="col-md-12 col-lg-6">0776789900</div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <label>Item Owner</label>
              <div class="form-group full-width">
                <p>
                  By <strong>{{ user.firstname }} {{ user.lastname }}</strong>
                </p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="w-100 d-flex justify-content-end">
                <button type="button" class="btn btn-light mr-3">Cancel</button>
                <button type="button" class="btn btn-success" @click="publish">
                  Publish
                </button>
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
      form: {
        itemName: "",
        description: "",
        price: null,
        // rentType: null,
        contactnumber: "",
        isAvailable: true,
        images: [],
        selectedCatId: null,
        selectedCountryId: null,
        selectedProvinceId: null,
        selectedCityId: null,
        selectedDistrictId: null,
        selectedImage: null,
      },
      rentTypes: [],
      categories: [],
      catBreadCrumb: [],
      provinces: [],
      districts: [],
      cities: [],
      categoriesList: [],
      isEndCategory: false,
    };
  },
  props: {
    user: {
      type: Object,
    },
  },
  computed: {},
  methods: {
    removeImage(imageId) {
      const filteredImages = this.form.images.filter((image) => {
        return image.id !== imageId;
      });
      this.form.images = filteredImages;
      if (this.form.images.length === 0) {
        this.form.selectedImage = null;
      }
      if (this.form.selectedImage.id === imageId) {
        this.form.selectedImage = null;
        if (this.form.images.length > 0) {
          this.form.selectedImage = this.form.images[0];
        }
      }
    },
    selectImage(image) {
      this.form.selectedImage = image;
    },
    uploadImage(event) {
      var formData = new FormData();
      formData.append("image", event.target.files[0]);
      axios
        .post("/apinew/upload_image/", formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
        .then((response) => {
          if (response.status === 200) {
            if (this.form.images.length < 5) {
              let imageObject = {
                id: response.data.file.id,
                name: response.data.file.name,
              };
              this.form.images.push(imageObject);
              if (this.form.images.length === 1) {
                this.selectImage(this.form.images[0]);
              }
            } else {
              alert("You cannot upload more than five images");
            }
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    basicdata() {
      let url = "/apinew/add";
      var form = new FormData();
      form.append("itemName", this.itemName);
      form.append("description", this.description);
      form.append("price", this.price);
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
    getRentTypes() {
      let url = "/apinew/getRentTypes/";
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          if (response.status === 200) {
            this.rentTypes = response.data.rent;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getCategories(item, updatedLevel) {
      const catId = (item && item.cat.category_id) || 0;
      const url = `/apinew/getCategories/?parent_id=${catId}`;
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          if (response.status === 200) {
            if (updatedLevel > -1) {
              this.categoriesList = this.categoriesList.filter((cat) => {
                return !(cat.level > updatedLevel);
              });
              console.log(this.categoriesList, updatedLevel);
            }
            if (
              response.data.categories &&
              response.data.categories.length > 0
            ) {
              let level = this.categoriesList.length;
              this.categoriesList.push({
                level: level,
                categories: response.data.categories,
              });
              this.isEndCategory = false;
            } else {
              this.isEndCategory = true;
              this.form.selectedCatId = item;
            }
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    resetFields() {
      this.form = {
        itemName: "",
        description: "",
        price: null,
        // rentType: null,
        contactnumber: "",
        isAvailable: true,
        images: [],
        selectedCatId: null,
        selectedCountryId: null,
        selectedProvinceId: null,
        selectedCityId: null,
        selectedDistrictId: null,
        selectedImage: null,
      };
      this.categoriesList.forEach((item) => {
        if (item.categories) {
          item.categories.map((cat) => {
            cat.selectedCatId = null;
          });
        }
      });
      this.getCategories();
      this.getProvince();
    },
    getProvince() {
      let url = "/apinew/getLocations/";
      url = `${url}?country_id=1`;
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          if (response.status === 200) {
            this.provinces = response.data.states;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getDistricts() {
      const url = `/apinew/getLocations/?province_id=${this.form.selectedProvinceId}`;
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          if (response.status === 200) {
            this.form.selectedDistrictId = null;
            this.districts = [];
            this.form.selectedCityId = null;
            this.cities = [];
            this.districts = response.data.districts;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getCities() {
      let url = `/apinew/getLocations/?district_id=${this.form.selectedDistrictId}`;
      axios({
        method: "get",
        url: url,
      })
        .then((response) => {
          if (response.status === 200) {
            this.form.selectedCityId = null;
            this.cities = response.data.cities;
          }
        })
        .catch((error) => {
          console.error(error);
        });
    },
    publish() {
      let url = "/apinew/add/";
      var form = new FormData();
      form.append("user_id", this.user.user_id);
      form.append("itemname", this.form.itemName);
      form.append("description", this.form.description);
      form.append("price", this.form.price);
      // form.append("rent_type", this.form.rentType);
      form.append("province_id", this.form.selectedProvinceId);
      form.append("district_id", this.form.selectedDistrictId);
      form.append("city_id", this.form.selectedCityId);
      form.append("category_id", this.form.selectedCatId.cat.category_id);
      form.append("image_ids", JSON.stringify(this.form.images));
      if (this.form.itemName.trim() === "") {
        this.$toast.error("You cannot keep item name empty");
      } else if (parseInt(this.form.price) === 0) {
        this.$toast.error("You cannot keep rent price zero");
      } else if (this.form.price === null || this.form.price === "") {
        this.$toast.error("You cannot keep rent price empty");
      } else {
        axios({
          method: "post",
          url: url,
          data: form,
        })
          .then((response) => {
            this.resetFields();
            this.$toast.success("You have successfully published a post");
            console.log(response);
          })
          .catch((error) => {
            console.error(error);
          });
      }
    },
  },
  mounted() {
    this.getRentTypes();
    this.getCategories();
    this.getProvince();
  },
};
</script>

<style lang="scss" scoped>
.main-image {
  width: 100%;
  height: 300px;
  background-position: center;
  background-size: cover;
  background-repeat: no-repeat;
}
</style>