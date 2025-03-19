<template>
    <div class="hot-list-card">
      <div class="list-header">
        <div class="logo" :class="platform.logoClass"></div>
        <span class="list-title">{{ platform.name }}</span>
      </div>
      <div class="list-content">
        <div v-if="platform.isLoading" class="loading">
          数据加载中...
        </div>
        <div v-else-if="platform.error" class="error">
          数据加载失败，请刷新重试。
        </div>
        <div v-else>
          <div
            class="list-item"
            v-for="(item, itemIndex) in platform.hotList"
            :key="itemIndex"
          >
            <span
              class="rank"
              :class="{
                'top1': item.hotRank === 1,
                'top2': item.hotRank === 2,
                'top3': item.hotRank === 3
              }"
            >
              {{ item.hotRank }}
            </span>
            <a
              :href="item.hotUrl"
              target="_blank"
              class="item-title"
              :title="item.hotTitle"
            >
              {{ item.hotTitle.length > 30 ? item.hotTitle.substring(0, 30) + '...' : item.hotTitle }}
            </a>
            <span class="score">{{ formatHotValue(item.hotValue) }}</span>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import { useTheme } from '../composables/useTheme';
  
  export default {
    props: {
      platform: {
        type: Object,
        required: true
      }
    },
    setup(props) {
      const formatHotValue = (value) => {
        if (value > 10000) {
          return (value / 10000).toFixed(1) + '万';
        }
        return value;
      };
  
      return {
        formatHotValue
      };
    }
  };
  </script>