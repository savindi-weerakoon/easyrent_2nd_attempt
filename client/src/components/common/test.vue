<template>
  <div>
    <button>{{username}}</button>
  </div>
</template>

<script>
export default {
  name: "test",
  data (){
    return {
      form: {
        name: '',
        description: '',
        rentType: 1,
        rentTypes: [],
        rentPrice: '',
        isAvilable: true,
        contactNumbers: [],
        images: []
      },
    }
  },
  props: {
    username: {
      type: String,
      default: 'Saman',
    }
  }
}
</script>