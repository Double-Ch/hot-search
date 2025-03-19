<template>
  <div class="home">
    <Header />
    <div class="container">
      <div class="list-wrapper">
        <HotListCard
          v-for="(platform, index) in platforms"
          :key="index"
          :platform="platform"
        />
      </div>
    </div>
  </div>
</template>

<script>
import Header from './components/Header.vue';
import HotListCard from './components/HotListCard.vue';
import { useHotList } from './composables/useHotList';

export default {
  components: {
    Header,
    HotListCard
  },
  setup() {
    const { platforms } = useHotList();
    
    return {
      platforms
    };
  }
};
</script>