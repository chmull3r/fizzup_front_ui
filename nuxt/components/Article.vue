<template>
  <div>
    <div class="row">
      <div class="col-12">
        <h2 class="my-4">Question</h2>
        <div style="box-shadow: 2px 3px 9px 4px rgba(0,0,0,0.04);">
          <div class="q-container-show p-4">
            <div class="row">
              <div class="col-2 text-center">
                <img class="article-image" :src="article.image" width="100" height="100">
              </div>
              <div class="col">
                <h1 class="q-title-show">{{ article.question }}</h1>
                <div class="q-display p-3">
                  <i class="fa fa-quote-left mr-3"></i>
                  <p class="d-inline">{{ article.content }}</p>
                  <p class="pt-4"><strong>-- {{ article.author }}</strong></p>
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
export default {
  props: ['article'],
}

</script>
