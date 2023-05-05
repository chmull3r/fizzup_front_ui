<template>
  <div class="container">
<!--  <<Article :article="$article"></Article>-->
<!--  <CommentForm></CommentForm>div>-->

    <div class="milkyway"></div>
    <CommentsList></CommentsList>
    <!--  <div>{{ comments }}</div>-->
  </div>
</template>

<script>
// export const getComments = async () => {
//   const comments = await $axios.$get('http://localhost:8740/comments')
//   return { comments}
// }

import Article from "../components/Article.vue";
import CommentForm from "../components/CommentForm.vue";
import CommentsList from "../components/CommentsList.vue";

export default {
  components: {CommentForm, Article},
  // async asyncData() {
  //  const comments = await fetch('http://localhost:8740/comments')
  //  return {comments}
  // },
  layout: 'Header',
}
</script>
