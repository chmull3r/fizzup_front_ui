<template>
  <div class="container">
  <<Article :article="article"></Article>
<!--  <CommentForm></CommentForm>div>-->

    <div class="milkyway"></div>
    <CommentsList></CommentsList>
    <!--  <div>{{ comments }}</div>-->
  </div>
</template>

<script>
import Article from "../components/Article.vue";
import CommentForm from "../components/CommentForm.vue";
import CommentsList from "../components/CommentsList.vue";

export default {
  components: {CommentForm, Article},
  layout: 'Header',
  data() {
    return {
      article: {
        'image': 'images/corgi_in_mountains.jpg',
        'question': 'un corgi peut-il marcher 30km dans les Vosges en une seule et même journée ?',
        'author': 'HappyRando',
        'content': "Ut et accumsan turpis. Aenean fermentum urna in neque convallis mollis. Sed a dictum eros. Sed ex leo, pellentesque at dictum id, gravida ac mauris. Praesent nec pellentesque odio. Duis pharetra, justo ac mattis dignissim, lorem ipsum iaculis odio, quis commodo tellus felis eget eros. Sed iaculis mi ut felis bibendum molestie. In id hendrerit ex. Phasellus gravida porta tortor tempor accumsan. Maecenas tempus enim a congue aliquam."
      },
      articleFromApi: []
    }
  },
  created() {
    //   this.fetchArticle();
  },
  methods: {
    async fetchArticle() {
      try {
        this.articleFromApi = await fetch('http://api_cosmic:8740/article');
      } catch (error) {
        this.errors = error.message;
      }
    },
  }
}
</script>
