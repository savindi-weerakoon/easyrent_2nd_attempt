// <template>
//   <div class="TopCategories">
//     <div class="row">
//       {{categories}}
//       <div class="col-lg-3 mt-3" v-for="category in categories" :key="category.category._id">
//         <img src="./../../assets/images/image_02.jpg" class="img-thumbnail" />
//         <h4 class="mt-3 ml-3">{{category.category_name}}</h4>
//       </div>
//     </div>
//   </div>
// </template>

// <script>
// export default {
//   name: 'categories',
//   props: {
//     categories: {
//       type: Array
//     }
//   }
// }
// </script>