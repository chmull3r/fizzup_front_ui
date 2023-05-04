<template>
<!--  <Header/>-->
  <div>
    <NuxtLink to="/">Home</NuxtLink>
    <div>{{ comments }}</div>
  </div>
</template>

<script>
import Header from "../components/Header.vue";
// export const getComments = async () => {
//   const comments = await $axios.$get('http://localhost:8740/comments')
//   return { comments}
// }

export default {
  async asyncData() {
    const comments = await fetch('http://localhost:8740/comments')
    return {comments}
  }
}
</script>
