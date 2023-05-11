<template>
  <div class="container">
    <div v-if="showErrorsModal || errors.length > 0" class="card text-center">
      <div class="card-header">
        Oops !
      </div>
      <div class="card-body">
        <h5 class="card-title">Une erreur s'est produite</h5>
        <p class="card-text">{{ errors }}</p>
        <a href="#" class="btn btn-primary">Nous contacter</a>
      </div>
      <div class="card-footer text-muted">
        <button @click="showErrorsModal = !showErrorsModal" type="button" class="btn btn-outline-danger">X</button>
      </div>
    </div>
    <Article :article="article"></Article>
    <CommentForm @newCommentInLocalStorage="getCommentsFromLocalStorage"></CommentForm>
    <div class="milkyway"></div>
    <CommentsList :comments="comments"></CommentsList>
  </div>
</template>

<script>
import Article from "../components/Article.vue";
import CommentForm from "../components/CommentForm.vue";
import CommentsList from "../components/CommentsList.vue";

export default {
  components: {Article, CommentForm, CommentsList},
  layout: 'Header',
  data() {
    return {
      article: {
        'id': '68',
        'image': 'images/corgi_in_mountains.jpg',
        'titre': 'Randonnée de 30km dans les Vosges avec un Corgi en une seule et même journée',
        'author': 'HappyRando',
        'content': "Ut et accumsan turpis. Aenean fermentum urna in neque convallis mollis. Sed a dictum eros. Sed ex leo, pellentesque at dictum id, gravida ac mauris. Praesent nec pellentesque odio. Duis pharetra, justo ac mattis dignissim, lorem ipsum iaculis odio, quis commodo tellus felis eget eros. Sed iaculis mi ut felis bibendum molestie. In id hendrerit ex. Phasellus gravida porta tortor tempor accumsan. Maecenas tempus enim a congue aliquam."
      },
      articleFromApi: [],
      comments: [
        {
          "pseudo": "Marydu68",
          "email": "mary68@gmail.com",
          "note": 5,
          "opinion": "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "image": "https://api.cloudly.space/resize/clip/1200/760/75/aHR0cHM6Ly9zdGF0aWMuYXBpZGFlLXRvdXJpc21lLmNvbS9maWxlc3RvcmUvb2JqZXRzLXRvdXJpc3RpcXVlcy9pbWFnZXMvMTg4LzEvMTA0MjA2NjguanBn/image.jpg",
          "date": "2023-01-16T23:17:17.000Z",
        },
        {
          "pseudo": "Cokiet_fluff",
          "email": "cfluff@outlokk.fr",
          "note": 2,
          "opinion": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          "image": "https://i.redd.it/e9nejy2ijtg31.jpg",
          "date": "2021-05-01T14:02:30.000Z",
        },
        {
          "pseudo": "PascalMorin",
          "email": "pascalmo@orange.fr",
          "note": 1,
          "opinion": "Ac turpis egestas sed tempus. At lectus urna duis convallis convallis tellus id interdum. Odio eu feugiat pretium nibh ipsum consequat nisl vel. Et ligula ullamcorper malesuada proin libero nunc consequat interdum varius. Id faucibus nisl tincidunt eget nullam non nisi est sit. Iaculis urna id volutpat lacus laoreet non curabitur. Id ornare arcu odio ut sem nulla.",
          "image": "https://youdidwhatwithyourweiner.com/wp-content/uploads/2018/06/Dog-Mountain-Trail-Slider.jpg",
          "date": "2022-06-25T01:56:50.000Z",
        },
      ],
      commentsFromApi: [],
      errors: [],
      showErrorsModal: false
    }
  },
  created() {
    //   this.fetchArticle();
    //   this.fetchComments();
    this.getCommentsFromLocalStorage();
  },
  methods: {
    async fetchArticle() {
      try {
        this.articleFromApi = await fetch('http://api_cosmic:8740/article');
      } catch (errorResponse) {
        this.errors = errorResponse.error;
        this.showErrorsModal = true;
      }
    },
    async fetchComments() {
      try {
        this.commentsFromApi = await fetch('http://api_cosmic:8740/comments');
      } catch (errorResponse) {
        this.errors = errorResponse.error;
        this.showErrorsModal = true;
      }
    },
    getCommentsFromLocalStorage() {
      const commentsFromLocalStorage = JSON.parse(localStorage.getItem('localComments'));
      if (commentsFromLocalStorage) {
        commentsFromLocalStorage.forEach(value => {
          value['note'] = parseInt(value['note']);
          this.comments.unshift(value);
        });
      }
    }
  }
}
</script>
